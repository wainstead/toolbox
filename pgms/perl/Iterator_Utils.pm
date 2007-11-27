package Iterator_Utils;

# $Id: Iterator_Utils.pm,v 1.1 2006/01/25 21:02:06 swain Exp $

use base Exporter;

@EXPORT_OK = qw(NEXTVAL Iterator
                append imap igrep
                iterate_function filehandle_iterator list_iterator);
%EXPORT_TAGS = ('all' => \@EXPORT_OK);

sub NEXTVAL { $_[0]->() }
sub Iterator (&) { return $_[0] }

1;
