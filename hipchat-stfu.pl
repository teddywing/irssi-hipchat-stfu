use strict;
use vars qw($VERSION %IRSSI);

use Irssi qw(signal_add);

$VERSION = '1.00';
%IRSSI = (
	authors     => 'Teddy Wing',
	contact     => 'irssi@teddywing.com',
	name        => 'HipChat STFU',
	description => 'Silences annoying messages originating from HipChat.',
	license     => 'MIT',
);

sub test {
	my ($server, $text, $nick) = @_;
	
	my $filename = 'hipchat-stfu-output.txt';
	open(my $fh, '>>', $filename) or die;
	print $fh $server;
	print $fh "\t";
	print $fh $text;
	print $fh "\t";
	print $fh $nick;
	print $fh "\n";
	close $fh;
};

signal_add {
	'message public' => \&test,
};
