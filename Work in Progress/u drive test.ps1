$User = [environment]::UserName

net use U: /delete

net use U: \\sancfs001.icwgrp.com\icwusers$\$User /persistent:yes
