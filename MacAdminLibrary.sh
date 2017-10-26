#!/bin/bash

# Common Aliases
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
jamfBinary=$(/usr/bin/which jamf)

# Snippets

# Thanks to MacMule for this snippet https://macmule.com/2014/11/19/how-to-get-the-currently-logged-in-user-in-a-more-apple-approved-way/
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# Print Uptime in a pretty way
days="days"
hrs=" hrs"

daysCheck=$(uptime | awk {'print $4'})

if [ $daysCheck = "$days" ]; then
uptimePretty=$(uptime | awk {'print $3.$4.$5'} | sed 's/,/ /g' | sed 's/d/ d/g')
    echo "$result Hours"
    else
uptimePretty=$(uptime | awk {'print $3'} | sed 's/,//g')
    echo "$result Hours"
fi

exit 0
