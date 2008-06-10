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

RT::Transaction


=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=cut

package RT::Transaction;
use RT::Record; 


use vars qw( @ISA );
@ISA= qw( RT::Record );

sub _Init {
  my $self = shift; 

  $self->Table('Transactions');
  $self->SUPER::_Init(@_);
}





=head2 Create PARAMHASH

Create takes a hash of values and creates a row in the database:

  varchar(64) 'ObjectType'.
  int(11) 'ObjectId'.
  int(11) 'TimeTaken'.
  varchar(20) 'Type'.
  varchar(40) 'Field'.
  varchar(255) 'OldValue'.
  varchar(255) 'NewValue'.
  varchar(255) 'ReferenceType'.
  int(11) 'OldReference'.
  int(11) 'NewReference'.
  varchar(255) 'Data'.

=cut




sub Create {
    my $self = shift;
    my %args = ( 
                ObjectType => '',
                ObjectId => '0',
                TimeTaken => '0',
                Type => '',
                Field => '',
                OldValue => '',
                NewValue => '',
                ReferenceType => '',
                OldReference => '',
                NewReference => '',
                Data => '',

		  @_);
    $self->SUPER::Create(
                         ObjectType => $args{'ObjectType'},
                         ObjectId => $args{'ObjectId'},
                         TimeTaken => $args{'TimeTaken'},
                         Type => $args{'Type'},
                         Field => $args{'Field'},
                         OldValue => $args{'OldValue'},
                         NewValue => $args{'NewValue'},
                         ReferenceType => $args{'ReferenceType'},
                         OldReference => $args{'OldReference'},
                         NewReference => $args{'NewReference'},
                         Data => $args{'Data'},
);

}



=head2 id

Returns the current value of id. 
(In the database, id is stored as int(11).)


=cut


=head2 ObjectType

Returns the current value of ObjectType. 
(In the database, ObjectType is stored as varchar(64).)



=head2 SetObjectType VALUE


Set ObjectType to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ObjectType will be stored as a varchar(64).)


=cut


=head2 ObjectId

Returns the current value of ObjectId. 
(In the database, ObjectId is stored as int(11).)



=head2 SetObjectId VALUE


Set ObjectId to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ObjectId will be stored as a int(11).)


=cut


=head2 TimeTaken

Returns the current value of TimeTaken. 
(In the database, TimeTaken is stored as int(11).)



=head2 SetTimeTaken VALUE


Set TimeTaken to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, TimeTaken will be stored as a int(11).)


=cut


=head2 Type

Returns the current value of Type. 
(In the database, Type is stored as varchar(20).)



=head2 SetType VALUE


Set Type to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Type will be stored as a varchar(20).)


=cut


=head2 Field

Returns the current value of Field. 
(In the database, Field is stored as varchar(40).)



=head2 SetField VALUE


Set Field to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Field will be stored as a varchar(40).)


=cut


=head2 OldValue

Returns the current value of OldValue. 
(In the database, OldValue is stored as varchar(255).)



=head2 SetOldValue VALUE


Set OldValue to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, OldValue will be stored as a varchar(255).)


=cut


=head2 NewValue

Returns the current value of NewValue. 
(In the database, NewValue is stored as varchar(255).)



=head2 SetNewValue VALUE


Set NewValue to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, NewValue will be stored as a varchar(255).)


=cut


=head2 ReferenceType

Returns the current value of ReferenceType. 
(In the database, ReferenceType is stored as varchar(255).)



=head2 SetReferenceType VALUE


Set ReferenceType to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ReferenceType will be stored as a varchar(255).)


=cut


=head2 OldReference

Returns the current value of OldReference. 
(In the database, OldReference is stored as int(11).)



=head2 SetOldReference VALUE


Set OldReference to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, OldReference will be stored as a int(11).)


=cut


=head2 NewReference

Returns the current value of NewReference. 
(In the database, NewReference is stored as int(11).)



=head2 SetNewReference VALUE


Set NewReference to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, NewReference will be stored as a int(11).)


=cut


=head2 Data

Returns the current value of Data. 
(In the database, Data is stored as varchar(255).)



=head2 SetData VALUE


Set Data to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Data will be stored as a varchar(255).)


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
        ObjectType => 
		{read => 1, write => 1, sql_type => 12, length => 64,  is_blob => 0,  is_numeric => 0,  type => 'varchar(64)', default => ''},
        ObjectId => 
		{read => 1, write => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => '0'},
        TimeTaken => 
		{read => 1, write => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => '0'},
        Type => 
		{read => 1, write => 1, sql_type => 12, length => 20,  is_blob => 0,  is_numeric => 0,  type => 'varchar(20)', default => ''},
        Field => 
		{read => 1, write => 1, sql_type => 12, length => 40,  is_blob => 0,  is_numeric => 0,  type => 'varchar(40)', default => ''},
        OldValue => 
		{read => 1, write => 1, sql_type => 12, length => 255,  is_blob => 0,  is_numeric => 0,  type => 'varchar(255)', default => ''},
        NewValue => 
		{read => 1, write => 1, sql_type => 12, length => 255,  is_blob => 0,  is_numeric => 0,  type => 'varchar(255)', default => ''},
        ReferenceType => 
		{read => 1, write => 1, sql_type => 12, length => 255,  is_blob => 0,  is_numeric => 0,  type => 'varchar(255)', default => ''},
        OldReference => 
		{read => 1, write => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => ''},
        NewReference => 
		{read => 1, write => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => ''},
        Data => 
		{read => 1, write => 1, sql_type => 12, length => 255,  is_blob => 0,  is_numeric => 0,  type => 'varchar(255)', default => ''},
        Creator => 
		{read => 1, auto => 1, sql_type => 4, length => 11,  is_blob => 0,  is_numeric => 1,  type => 'int(11)', default => '0'},
        Created => 
		{read => 1, auto => 1, sql_type => 11, length => 0,  is_blob => 0,  is_numeric => 0,  type => 'datetime', default => ''},

 }
};


        eval "require RT::Transaction_Overlay";
        if ($@ && $@ !~ qr{^Can't locate RT/Transaction_Overlay.pm}) {
            die $@;
        };

        eval "require RT::Transaction_Vendor";
        if ($@ && $@ !~ qr{^Can't locate RT/Transaction_Vendor.pm}) {
            die $@;
        };

        eval "require RT::Transaction_Local";
        if ($@ && $@ !~ qr{^Can't locate RT/Transaction_Local.pm}) {
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

RT::Transaction_Overlay, RT::Transaction_Vendor, RT::Transaction_Local

=cut


1;
