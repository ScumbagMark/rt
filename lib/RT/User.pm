# $Header$
# (c) 1996-2000 Jesse Vincent <jesse@fsck.com>
# This software is redistributable under the terms of the GNU GPL
#

package RT::User;
use RT::Record;
@ISA= qw(RT::Record);

# {{{ sub new 
sub new  {
  my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self  = {};
  bless ($self, $class);
  $self->{'table'} = "Users";
  $self->_Init(@_);

  return($self);
}
# }}}

# {{{ sub _Accessible 
sub _Accessible  {
  my $self = shift;
  my %Cols = (
	      # {{{ Core RT info
	      UserId => 'read/write',
	      Password => 'write',
	      Comments => 'read/write',
	      Signature => 'read/write',
	      EmailAddress => 'read/write',
	      FreeformContactInfo => 'read/write',
	      Organization => 'read/write',
	      Disabled => 'read', #To modify this attribute, we have helper
				  #methods
	      CanManipulate => 'read/write',
	      # }}}
	      
	      # {{{ Names
	      
	      RealName => 'read/write',
	      NickName => 'read/write',
	      # }}}
	      
	      
	      
	      # {{{ Localization and Internationalization
	      Lang => 'read/write',
	      EmailEncoding => 'read/write',
	      WebEncoding => 'read/write',
	      # }}}
	      
	      # {{{ External ContactInfo Linkage
	      ExternalContactInfoId => 'read/write',
	      ContactInfoSystem => 'read/write',
	      # }}}
	      
	      # {{{ User Authentication identifier
	      ExternalAuthId => 'read/write',
	      #Authentication system used for user 
	      AuthSystem => 'read/write',
	      Gecos => 'read/write', #Gecos is the name of the fields in a unix passwd file. In this case, it refers to "Unix Username"
	      # }}}
	      
	      # {{{ Telephone numbers
	      HomePhone =>  'read/write',
	      WorkPhone => 'read/write',
	      MobilePhone => 'read/write',
	      PagerPhone => 'read/write',
	      # }}}
	      
	      # {{{ Paper Address
	      Address1 => 'read/write',
	      Address2 => 'read/write',
	      City => 'read/write',
	      State => 'read/write',
	      Zip => 'read/write',
	      Country => 'read/write',
	      # }}}
	      
	      # {{{ Core DBIx::Record Attributes
	      Creator => 'read/auto',
	      Created => 'read/auto',
	      LastUpdatedBy => 'read/auto',
	      LastUpdated => 'read/auto'
	      # }}}
	     );
  return($self->SUPER::_Accessible(@_, %Cols));
}
# }}}

# {{{ sub Create 
sub Create  {
  my $self = shift;
  my %args = (#TODO: insert argument list 
	      @_ # get the real argumentlist
	     );

  ##TODO: unless defined $args{'Password'}, make a random password.

  #Todo we shouldn't do anything if we have no password to start.
  #return (0,"That password is too short") if length($args{'Password'}) < $RT::user_passwd_min;
  
  #TODO Specify some sensible defaults.
  #TODO check ACLs

  my $id = $self->SUPER::Create(%args);
  $self->Load($id);
  
  #TODO: this is horrificially wasteful. we shouldn't commit 
  # to the db and then instantly turn around and load the same data

  ## TODO: Document WelcomeMessage in config.pm

  ## TODO: It makes a difference if the user was created via email or
  ## via web (by themselves) or via the admin tools.  Tobix actually
  ## thinks that it makes more sense having "send welcome message" as
  ## a User object method, and do it through the respective tools than
  ## through Users.pm.
  if ($RT::WelcomeMessage) {
      #TODO: Check if the email exists and looks valid
      #TODO: Send the user a "welcome message"  see [fsck.com #290]
  }

  return (1,"User created");
}
# }}}

# {{{ sub Delete 

sub Delete  {
  my $self = shift;

  my $new_owner = shift;

  #TODO: check ACLS  
  #TODO: Here, we should take all this admin's tickets that
  #      are stalled or open and reassign them to $new_owner;
  #      additionally, we should nuke this user's acls



  my ($query_string,$update_clause, $user_id);
  
  #TODO Handle User->Delete
  die "User->Delete not implemented";
  $user_id=$self->_Handle->quote($self->UserId);
  
  if ($self->CurrentUser->IsAdministrator) {
    
    if ($self->UserId  ne $self->CurrentUser) {
      $query_string = "DELETE FROM users WHERE UserId = $user_id";
      $query_string = "DELETE FROM queue_acl WHERE UserId = $user_id";

      
      return ("User deleted.");
      
    }
    else {
      return("You may not delete yourself. (Do you know why?)");
    }
  }
  else {
    return("You do not have the privileges to delete that user.");
  }
  
}

# }}}

# {{{ sub Load 
sub Load  {
  my $self = shift;
  my $identifier = shift || return undef;

  #if it's an int, load by id. otherwise, load by name.
  if ($identifier !~ /\D/) {
    $self->SUPER::LoadById($identifier);
  }
  else {

   $self->LoadByCol("UserId",$identifier);
  }
}
# }}}

# {{{ sub LoadByEmail
sub LoadByEmail {
    my $self=shift;
    # TODO: check the "AlternateEmails" table if this fails.
    return $self->LoadByCol("EmailAddress", @_);
}
# }}}

#used to check if a password is correct
# {{{ sub IsPassword

sub IsPassword { 
  my $self = shift;
  my $value = shift;
  
  if ($self->Disabled) {
  	$RT::Logger->info("Disabled user ".$self->UserId." tried to log in");
	return(undef);
  }
  if ($value == $self->_Value('Password')) {
    return (1);
  }
  else {
    return (undef);
  }
}
# }}}

# {{{ sub Signature 

sub Signature {
    my $self=shift;
    return ($self->SUPER::Signature);
    
    ## TODO: The stuff below might be a nice feature, but since we don't need it
    ## at the moment, it's left out.
	
    if (0) {
		my @entry=getpwnam($self->Gecos || $self->UserId);
		my $home=$entry[7];
		## TODO: Check if the commented out line might work better
		#       for my $trythis (@RT::signature) {
		for my $trythis ("$home/.signature", "$home/pc/sign.txt", "$home/pc/sign") {
			if (-r $trythis) {
				local($/);
				undef $/;
				open(SIGNATURE, "<$trythis"); 
				$signature=<SIGNATURE>;
				close(SIGNATURE);
				return $signature;
			}
		}
		return undef;
    }
}
# }}}

# {{{ sub Disable

=head2 Sub Disable

Disable takes no arguments and returns 1 on success and undef on failure.
It causes this user to have his/her disable flag set.  If this flag is
set, all password checks for this user will fail. All ACL checks for this
user will fail.

=cut 

sub Disable {
        my $self = shift;
			   if ($self->CurrentUser->HasSystemRight('AdminUsers')) {
				   return($self->_Set('Disabled',1));
			   }
}
# }}}

# {{{ sub Enable

=head2 Sub Enable

Disable takes no arguments and returns 1 on success and undef on failure.
It causes this user to have his/her disable flag unset.  see sub Disable
for a fuller treatment of this

=cut 

sub Enable {
	my $self = shift;
	
	if ($self->CurrentUser->HasSystemRight('AdminUsers')) {
	  return($self->_Set('Disabled',0));
}
}

# }}}
# {{{ sub HasQueueRight
=head2 HasQueueRight( QueueObj => RT::Queue, Right => 'Right' )

Returns 1 if this user has the right specified in the paramhash. for the queue
passed in.

Returns undef if they don't

=cut

sub HasQueueRight {
	my $self = shift;
	my %args = ( QueueObj => undef,
				 Right => undef,
				 @_);
	
	unless (ref ($args{'QueueObj'}) =~ /^RT::Queue/) {
		$RT::Logger->debug("RT::User::HasQueueRight was passed $args{'QueueObj'} as a queue object");
	}
	
	return ($self->_HasRight(Scope => 'Queue',
				AppliesTo => $args{'QueueObj'}->Id,
				Right => "$args{'Right'}"));
	
}

# }}}


# {{{ sub HasTicketRight

=head2 HasTicketRight( TicketObj => RT::Ticket, Right => 'Right' )

Returns 1 if this user has the ticket right specified for the ticket object
passed in.

Returns undef if they don't

=cut

sub HasTicketRight {
	my $self = shift;
	my %args = ( TicketObj => undef,
			 Right => undef,
			 @_);

	#Check to make sure that the ticketobj is really a ticketobject	
	unless (ref ($args{'TicketObj'}) =~ /^RT::Ticket/) {
		$RT::Logger->debug("RT::User::HasTicketRight was passed $args{'TicketObj'} as a ticket object. It's type is ".ref($args{'TicketObj'})."\n ");
	}
	
	return ($self->_HasRight(Scope => 'Ticket',
				AppliesTo => $args{'TicketObj'}->Queue->Id,
				Right => "$args{'Right'}"));
	
}

# }}}

# {{{ sub HasSystemRight

=head2 HasSystemRight ( Right => 'right')

Returns 1 if this user has the right 'right'

Returns undef if this user doesn't

=cut

sub HasSystemRight {
	my $self = shift;
	my %args = ( Right => 'undef',
				 @_);
	
	return ($self->_HasRight ( Scope => 'System',
				   Right => $args{'Right'}));
	
}

# }}}

# {{{ sub _HasRight

=head2 sub _HasRight (Right => 'right', Scope => 'scope',  AppliesTo => int,
					  ExtendedPrincipals => SQL)

_HasRight is a private helper method for checking a user's rights. It takes
several options:

=item Right is a textual right name

=item Scope is a textual scope name. (As of July these were Queue, Ticket and System

=item AppliesTo is the numerical Id of the object identified in the scope. For tickets, this is the queue #. for queues, this is the queue #

=item ExtendedPrincipals is an  SQL select clause which assumes that the only
table in play is ACL.  It's used by HasTicketRight to pass in which 
metaprincipals apply

Returns 1 if a matching ACE was found.

Returns undef if no ACE was found.

=cut


sub _HasRight {
	
	my $self = shift;
	my %args = ( Right => undef,
			 Scope => undef,
			 AppliesTo => 0,
			 ExtendedPrincipals => undef,
			 @_);
	

	if ($self->Disabled) {
		$RT::Logger->debug ("Disabled User:  ".$self->UserId." failed access check for ".$args{'Right'}." to object ".$args{'Scope'}."/".$args{'AppliesTo'}."\n");
		return (undef);
	}
	my $RightClause = "(Right = '$args{'Right'}')";
	
	my $ScopeClause = "(Scope = '$args{'Scope'}')";
	
	#If an AppliesTo was passed in, we should pay attention to it.
	#otherwise, none is needed

	$ScopeClause = "($ScopeClause AND ((AppliesTo = 0) OR (AppliesTo = $args{'AppliesTo'})))"
	  if ($args{'AppliesTo'});
	
	
	# The generic principals clause looks for users with my id
	# and Rights that apply to _everyone_
	my $PrincipalsClause =  "(((PrincipalType = 'User') AND (PrincipalId = ".$self->Id.")) OR (PrincipalType = 'Everyone'))";
    
	# If the user is the superuser, grant them the damn right ;)
	my $SuperUserClause = "(Right = 'SuperUser') AND (Scope = 'System') AND (AppliesTo = 0)";
	
	# If we've been passed in an extended principals clause, we should lump it
	# on to the existing principals clause. it'll make life easier
	if ($args{'ExtendedPrincipals'}) {
		$PrincipalsClause = "(($PrincipalsClause) OR ($args{'ExtendedPrincipalsClause'}))";
	}
	my $GroupPrincipalsClause = "((PrincipalType = 'Group') AND (PrincipalId = GroupMembers.Id) AND (GroupMembers.UserId = ".$self->Id."))";
	
	
	# This query checks to se whether the user has the right as a member of a group
	my $query_string_1 = "SELECT COUNT(ACL.id) FROM ACL, GroupMembers WHERE (((($ScopeClause) AND ($RightClause)) OR ($SuperUserClause)) AND ($GroupPrincipalsClause))";    
	
	# This query checks to see whether the current user has the right directly
	my $query_string_2 = "SELECT COUNT(ACL.id) FROM ACL WHERE (((($ScopeClause) AND ($RightClause)) OR ($SuperUserClause)) AND ($PrincipalsClause))";
	


	my ($hitcount);
#	$RT::Logger->debug("Now Trying $query_string_1\n");	
	$hitcount = $self->{'DBIxHandle'}->FetchResult($query_string_1);
  
	#if there's a match, the right is granted
	return (1) if ($hitcount);
#	$RT::Logger->debug("No ACL matched $query_string_1\n");	
	

	
	$hitcount = $self->{'DBIxHandle'}->FetchResult($query_string_2);
	return (1) if ($hitcount);

	$RT::Logger->debug("No ACL matched $query_string_2\n")	;
	
	return(0);
}

# }}}
1;
 
