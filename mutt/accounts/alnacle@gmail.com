# Personal stuff
set realname  = 'Alvaro Navarro'
set from      = 'alnacle@gmail.com'
set sendmail  = '/usr/bin/msmtp'

# Mailbox configuration
set mbox_type   =  Maildir
set folder      =  "~/Mail/"
set spoolfile   = "+inbox"
set mbox        = "+inbox"
set postponed   = "+drafts"
set record      = "+sent"

