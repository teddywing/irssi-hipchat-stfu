use strict;
use vars qw($VERSION %IRSSI);

use Irssi qw(signal_add signal_stop signal_continue);

$VERSION = '1.00';
%IRSSI = (
	authors     => 'Teddy Wing',
	contact     => 'irssi@teddywing.com',
	name        => 'HipChat STFU',
	description => 'Silences annoying messages originating from HipChat.',
	license     => 'MIT',
);

sub prettify_hipchat {
	my ($input) = @_;
	
	# Grab browse link
	my ($link) = $input =~ /"([^"]+\/browse\/[^"]+)"/;
	
	# Remove HTML tags
	$input =~ s/<.+?>//g;
	
	# Trim whitespace
	$input =~ s/^(\s| )+|(\s| )+$//g;
	
	# Trim whitespace between words
	$input =~ s/(\s| ){2,}/ /g;
	
	# Remove Priority
	$input =~ s/Priority://g;
	
	# Remove Status
	$input =~ s/Status://g;
	
	# Construct start message
	if ($link) {
		$input =~ s/Created by (.+)$/($1) ($link)/g;
	}
	
	return $input;
};

sub hipchat_stfu {
	my ($server, $text, $nick, $address, $target) = @_;
	
	if ($server->{'chatnet'} eq 'Bitlbee' &&
		$nick eq 'root') {
		my $msg = prettify_hipchat($text);
		
		if ($msg eq '') {
			signal_stop();
		}
		else {
			signal_continue($server, $msg, $nick, $address, $target);
		}
	}
};

signal_add('message public', \&hipchat_stfu);
