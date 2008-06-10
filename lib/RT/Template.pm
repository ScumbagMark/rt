# BEGIN BPS TAGGED BLOCK {{{
# 
# COPYRIGHT:
# 
# This software is Copyright (c) 1996-2008 Best Practical Solutions, LLC
#                                          <jesse@bestpractical.com>
# 
# (Except where explicitly superseded by other copyright notices)
# 
# 
# LICENSE:
# 
# This work is made available to you under the terms of Version 2 of
# the GNU General Public License. A copy of that license should have
# been provided with this software, but in any event can be snarfed
# from www.gnu.org.
# 
# This work is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301 or visit their web page on the internet at
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.html.
# 
# 
# CONTRIBUTION SUBMISSION POLICY:
# 
# (The following paragraph is not intended to limit the rights granted
# to you to modify and distribute this software under the terms of
# the GNU General Public License and is only of importance to you if
# you choose to contribute your changes and enhancements to the
# community by submitting them to Best Practical Solutions, LLC.)
# 
# By intentionally submitting any modifications, corrections or
# derivatives to this work, or any other work intended for use with
# Request Tracker, to Best Practical Solutions, LLC, you confirm that
# you are the copyright holder for those contributions and you grant
# Best Practical Solutions,  LLC a nonexclusive, worldwide, irrevocable,
# royalty-free, perpetual, license to use, copy, create derivative
# works based on those contributions, and sublicense and distribute
# those contributions and any derivatives thereof.
# 
# END BPS TAGGED BLOCK }}}

# Autogenerated by DBIx::SearchBuilder factory (by <jesse@bestpractical.com>)
# WARNING: THIS FILE IS AUTOGENERATED. ALL CHANGES TO THIS FILE WILL BE LOST.  
# 
# !! DO NOT EDIT THIS FILE !!
#

use strict;


=head1 NAME

RT::Template


=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=cut

package RT::Template;
use RT::Record; 
use RT::Queue;


use vars qw( @ISA );
@ISA= qw( RT::Record );

sub _Init {
  my $self = shift; 

  $self->Table('Templates');
  $self->SUPER::_Init(@_);
}





=head2 Create PARAMHASH

Create takes a hash of values and creates a row in the database:

  int(11) 'Queue'.
  varchar(200) 'Name'.
  varchar(255) 'Description'.
  varchar(16) 'Type'.
  varchar(16) 'Language'.
  int(11) 'TranslationOf'.
  blob 'Content'.

=cut




sub Create {
    my $self = shift;
    my %args = ( 
                Queue => '0',
                Name => '',
                Description => '',
                Type => '',
                Language => '',
                TranslationOf => '0',
                Content => '',

		  @_);
    $self->SUPER::Create(
                         Queue => $args{'Queue'},
                         Name => $args{'Name'},
                         Description => $args{'Description'},
                         Type => $args{'Type'},
                         Language => $args{'Language'},
                         TranslationOf => $args{'TranslationOf'},
                         Content => $args{'Content'},
);

}



=head2 id

Returns the current value of id. 
(In the database, id is stored as int(11).)


=cut


=head2 Queue

Returns the current value of Queue. 
(In the database, Queue is stored as int(11).)



=head2 SetQueue VALUE


Set Queue to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Queue will be stored as a int(11).)


=cut


=head2 QueueObj

Returns the Queue Object which has the id returned by Queue


=cut

sub QueueObj {
	my $self = shift;
	my $Queue =  RT::Queue->new($self->CurrentUser);
	$Queue->Load($self->__Value('Queue'));
	return($Queue);
}

=head2 Name

Returns the current value of Name. 
(In the database, Name is stored as varchar(200).)



=head2 SetName VALUE


Set Name to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Name will be stored as a varchar(200).)


=cut


=head2 Description

Returns the current value of Description. 
(In the database, Description is stored as varchar(255).)



=head2 SetDescription VALUE


Set Description to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Description will be stored as a varchar(255).)


=cut


=head2 Type

Returns the current value of Type. 
(In the database, Type is stored as varchar(16).)



=head2 SetType VALUE


Set Type to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Type will be stored as a varchar(16).)


=cut


=head2 Language

Returns the current value of Language. 
(In the database, Language is stored as varchar(16).)



=head2 SetLanguage VALUE


Set Language to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Language will be stored as a varchar(16).)


=cut


=head2 TranslationOf

Returns the current value of TranslationOf. 
(In the database, TranslationOf is stored as int(11).)



=head2 SetTranslationOf VALUE


Set TranslationOf to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, TranslationOf will be stored as a int(11).)


=cut


=head2 Content

Returns the current value of Content. 
(In the database, Content is stored as blob.)



=head2 SetContent VALUE


Set Content to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Content will be stored as a blob.)


=cut


=head2 LastUpdated

Returns the current value of LastUpdated. 
(In the database, LastUpdated is stored as datetime.)


=cut


=head2 LastUpdatedBy

Returns the current value of LastUpdatedBy. 
(In the database, LastUpdatedBy is stored as int(11).)


=cut


=head2 Creator

Returns the current value of Creator. 
(In the database, Creator is stored as int(11).)


=cut


=head2 Created

Returns the current value of Created. 
(In the database, Created is stored as datetime.)


=cut



sub _CoreAccessible {
    {
     
        id =>
		{read => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => ''},
        Queue => 
		{read => 1, write => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => '0'},
        Name => 
		{read => 1, write => 1, sql_type => 12, length => 200,  is_blob => 0,  is_numeric => 0,  type => 'varchar(200)', default => ''},
        Description => 
		{read => 1, write => 1, sql_type => 12, length => 255,  is_blob => 0,  is_numeric => 0,  type => 'varchar(255)', default => ''},
        Type => 
		{read => 1, write => 1, sql_type => 12, length => 16,  is_blob => 0,  is_numeric => 0,  type => 'varchar(16)', default => ''},
        Language => 
		{read => 1, write => 1, sql_type => 12, length => 16,  is_blob => 0,  is_numeric => 0,  type => 'varchar(16)', default => ''},
        TranslationOf => 
		{read => 1, write => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => '0'},
        Content => 
		{read => 1, write => 1, sql_type => -4, length => 0,  is_blob => 1,  is_numeric => 0,  type => 'blob', default => ''},
        LastUpdated => 
		{read => 1, auto => 1, sql_type => 11, length => 0,  is_blob => 0,  is_numeric => 0,  type => 'datetime', default => ''},
        LastUpdatedBy => 
		{read => 1, auto => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => '0'},
        Creator => 
		{read => 1, auto => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => '0'},
        Created => 
		{read => 1, auto => 1, sql_type => 11, length => 0,  is_blob => 0,  is_numeric => 0,  type => 'datetime', default => ''},

 }
};


        eval "require RT::Template_Overlay";
        if ($@ && $@ !~ qr{^Can't locate RT/Template_Overlay.pm}) {
            die $@;
        };

        eval "require RT::Template_Vendor";
        if ($@ && $@ !~ qr{^Can't locate RT/Template_Vendor.pm}) {
            die $@;
        };

        eval "require RT::Template_Local";
        if ($@ && $@ !~ qr{^Can't locate RT/Template_Local.pm}) {
            die $@;
        };




=head1 SEE ALSO

This class allows "overlay" methods to be placed
into the following files _Overlay is for a System overlay by the original author,
_Vendor is for 3rd-party vendor add-ons, while _Local is for site-local customizations.  

These overlay files can contain new subs or subs to replace existing subs in this module.

Each of these files should begin with the line 

   no warnings qw(redefine);

so that perl does not kick and scream when you redefine a subroutine or variable in your overlay.

RT::Template_Overlay, RT::Template_Vendor, RT::Template_Local

=cut


1;
