package LHHReplayer;

# $Id: LHHReplayer.pm,v 1.5 2006/05/05 21:02:31 swain Exp $

use Test::More qw(no_plan);
use Test::WWW::Mechanize;
use LWP::Debug qw(- debug conns trace); # turns on verbose output.

use strict;
use warnings;

sub new {
    my ($class, %args) = @_;
    my $self = bless {}, $class;
    $self->{script} = $args{script};
    $self->{mech} = _initMech();
    return $self;
}

sub run {

    my $self = shift;
    my @conversation = $self->_parse_script();

    my $counter = 0;

    foreach my $hashref (@conversation) {

        print "going for: ", $hashref->{URL}, "\n";
        #print Dumper($hashref->{HTTPREQUEST});
        my $response;

        if ($hashref->{METHOD} eq 'GET') {
            $response = $self->{mech}->get( $hashref->{URL} );
        } elsif ($hashref->{METHOD} eq 'POST') {
            $response = $self->{mech}->post( $hashref->{URL}, $self->_buildPostData($hashref->{POSTDATA}) );
        }

        ok($mech->success, "returned OK status: " . $mech->status);

        $mech->content_unlike( qr/fatal error/i, "No fatal errors (step $counter)");
        $mech->content_unlike( qr/parse error/i, "No parse errors (step $counter)");
        $mech->content_unlike( qr/mysql error/i, "No mysql errors (step $counter)");
        $mech->content_unlike( qr/out of bounds/i, "No out of bounds errors (step $counter)");
        $mech->content_unlike( qr/Error: No match for E-Mail Address and\/or Password\./i, "No login errors (step $counter)");
        $mech->content_unlike( qr/SQL\/DB Error/i, "No ez_sql errors (step $counter)");

        $counter++;
        
    }

}


sub getmech { return $_[0]->{mech}; }

# separate the URL from the response headers

sub _extractURL {
    my $self = shift;
    my $request = shift;

    my @lines = grep { /\w/} split /\n/, $request;
    my $URL = shift @lines;

    return ($URL, \@lines);
}


# get the method (GET, POST, etc)

sub _extractMethod { my $self = shift; return ( split / /, $_[0] )[0]; }


# get the POST data

sub _extractPOST {
    my $self = shift;
    my @array = @{$_[0]};
    return $array[$#array];    
}


# I could not find any class or function to do this for me... so...
sub _buildPostData ($) {
    my $self = shift;
    my $postdata = shift;
    $postdata =~ s/\+/ /g;
    my @data = split /&|=/, $postdata;    
    map { s/%([A-Fa-f\d]{2})/chr hex $1/eg } @data;
    #for (@data) { print "=> $_\n"; }
    return \@data;
}

sub _initMech {
    my $mech = Test::WWW::Mechanize->new();
    $mech->agent_alias( 'Windows IE 6' );
    $mech->cookie_jar(HTTP::Cookies->new(file => "lwpcookies.txt", autosave => 1));
    return $mech;
}

sub _parse_script {

    my $self = shift;

    # LiveHTTPHeaders puts this separator betwixt each request/response pair.
    $/ = '----------------------------------------------------------';

    die sprintf("No valid LHH input file provided: %s\n",  $self->{script})
        unless ($self->{script} && -e $self->{script});

    open INFILE, "< $self->{script}" 
        or die sprintf("can't open LHH script '%s': $!\n", $self->{script});

    unless ( -d "./trials") {
        die "Can't mkdir trials directory\n" unless mkdir("./trials");
    }


    # all request/response pairs will be stored in this array
    my @conversation = ();


    while (my $chunk = <INFILE>) {

        $chunk =~ s/\r//gm; # HTTP exchanges delimit lines with \r\n

        my ($request, $response) = split /^HTTP/m, $chunk, 2;

        next unless $request =~ /\w/; # skip uninteresting records.
        die "Got request but no response: $request $response\n"
            if ($request && !$response);

        my (%hash);

        my ($URL, $request_ar) = $self->_extractURL($request);

        die "No url.\n"     unless $URL;
        die "No request.\n" unless $request_ar;

        # build our hash, which will be placed in the @conversation array

        $hash{URL}          = $URL;
        $hash{REQUEST_AREF} = $request_ar;
        $hash{METHOD}       = $self->_extractMethod( $request_ar->[0] );

        if ( $hash{METHOD} eq 'POST' ) { $hash{POSTDATA} = $self->_extractPOST($request_ar); }

        $hash{RESPONSE_TXT} = $response;

        push @conversation, \%hash;
    }

    return @conversation;
}

1;

