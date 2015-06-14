use strict;
use vars qw($VERSION %IRSSI);

use Irssi qw(signal_add signal_stop);
use Data::Dumper;

$VERSION = '1.00';
%IRSSI = (
	authors     => 'Teddy Wing',
	contact     => 'irssi@teddywing.com',
	name        => 'HipChat STFU',
	description => 'Silences annoying messages originating from HipChat.',
	license     => 'MIT',
);

sub hipchat_stfu {
	my ($server, $text, $nick) = @_;
	
	if ($server->{'chatnet'} eq 'Bitlbee' &&
		$nick eq 'root') {
		if ($text =~ /^\s*$/) {
			signal_stop();
		}
		else {
			# Modify the text
		}
	}
};

signal_add {
	'message public' => \&hipchat_stfu,
};
