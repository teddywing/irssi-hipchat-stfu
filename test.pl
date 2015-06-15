#!/usr/bin/env perl -w

use strict;

use Test::More tests => 9;
require 'prettify_hipchat.pl';


is(prettify_hipchat('  <img src="https://somecompany.atlassian.net/images/16jira.png" height="16" width="16" />   <a href="https://somecompany.atlassian.net/browse/SC-2169"><b>SC-1000 : Some kind of issue text that is kind of long and describes the problem that we saw during testing.</b></a> Created by <a href="https://somecompany.atlassian.net/secure/ViewProfile.jspa?name=PersonN">Person Name</a><br />'),
	'SC-1000 : Some kind of issue text that is kind of long and describes the ' .
	'problem that we saw during testing. (Person Name) ' .
	'(https://somecompany.atlassian.net/browse/SC-2169)',
	'Title, link, and creator');
is(prettify_hipchat('<span style="color: dimgrey;">Type:</span>  <img src="https://somecompany.atlassian.net/images/icons/issuetypes/bug.png" height="16" width="16" /> Bug  '),
	'Type: Bug',
	'Type');
is(prettify_hipchat('    <span style="color: dimgrey;">Priority:</span>      <img src="http://pixshark.com/white-box-icon.htm" height="16" width="16" />'),
	'',
	'Priority label');
is(prettify_hipchat(' Not prioritized  '), 'Not prioritized', 'Priority tag body');
is(prettify_hipchat('<span style="color: dimgrey;">Status:</span>          '),
	'',
	'Status label');
is(prettify_hipchat('    <span class="aui-lozenge aui-lozenge-complete">'),
	'',
	'<span ...>');
is(prettify_hipchat('        To Do'), 'To Do', 'To Do');
is(prettify_hipchat('    </span>'), '', '</span>');
is(prettify_hipchat('<br />'), '', '<br />');
