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
	my ($data, $server, $window_item) = @_;
	return unless $window_item;
	my $filename = 'hipchat-stfu-output.txt';
	
	open(my $fh, '>', $filename) or die;
	print $fh $data;
	print $fh '-------###-------';
	print $fh $server;
	close $fh;
};

signal_add {
	'message public' => \&test,
};
