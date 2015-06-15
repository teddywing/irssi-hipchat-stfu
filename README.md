Irssi HipChat STFU
==================

An irssi plugin that tells HipChat to shut up and stop its assitry.

When a Jira issue comes in, HipChat will output a sequence of empty lines,
and finally raw HTML describing the issue:

	16:03:43 <@root> Message from unknown participant JIRA: 
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>  
	16:03:43 <@root>   <img 
	                 src="https://somecompany.atlassian.net/images/16jira.png" 
	                 height="16" width="16" />   <a 
	href="https://somecompany.atlassian.net/browse/SC-1000"><b>SC-1000 : Some 
	                 kind of issue text that is kind of long and describes the 
	                 problem that we saw during testing.</b></a> Created by <a 
	href="https://somecompany.atlassian.net/secure/ViewProfile.jspa?name=PersonN">Person Name</a><br />
	16:03:43 >> OpenURL 2
	16:03:43 <@root> <span style="color: dimgrey;">Type:</span>  <img 
	src="https://somecompany.atlassian.net/images/icons/issuetypes/bug.png" 
	                 height="16" width="16" /> Bug  
	16:03:43 >> OpenURL 7
	16:03:43 <@root>     <span style="color: dimgrey;">Priority:</span>      <img 
	                 src="http://pixshark.com/white-box-icon.htm" height="16" 
	                 width="16" />
	16:03:43 <@root>  Not prioritized  
	16:03:43 <@root> <span style="color: dimgrey;">Status:</span>          
	16:03:43 <@root>     <span class="aui-lozenge aui-lozenge-complete">
	16:03:43 <@root>         To Do
	16:03:43 <@root>     </span>
	16:03:43 <@root> <br />
	6:03:43 <@root> <br />


Installing this plugin transforms the prior output into this:

	20:08:24 <@root> Message from unknown participant JIRA:
	20:08:24 <@root> SC-1000 : Some kind of issue text that is kind of long and
	                 describes the problem that we saw during testing. (Person Name)
	                 (https://somecompany.atlassian.net/browse/SC-1000)
	20:08:24 <@root> Type: Bug
	20:08:24 <@root> Not prioritized
	20:08:24 <@root> To Do


## Requirements
* [irssi](http://irssi.org/)
* [BitlBee](http://bitlbee.org/)
* [HipChat](https://www.hipchat.com/)


## Installing

	$ git clone https://github.com/teddywing/irssi-hipchat-stfu.git
	$ cd irssi-hipchat-stfu
	$ cp hipchat-stfu.pl ~/.irssi/scripts
	$ cd ~/.irssi/scripts/autorun
	$ ln -s ../hipchat-stfu.pl .


## Testing
Run tests using the included shell script:

	$ ./test.sh

This script copies the transformation subroutine to a new file so that it can
be safely included from `test.pl`. The tests in `test.pl` are then executed to
confirm expected transformation.


## License
Licensed under the MIT License. See the included LICENSE file.
