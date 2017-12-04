# Backup

Any host runs backup and maintenance scripts daily, weekly and monthly.



## server

Host server is main file and backup server. It has a share/ it promotes through nfs to other local hosts. It runs samba and dlna.

It takes backup of share/ to local disc daily.

It copies backups to hosts/<hostname> of each host it monitores.



## pi

The pi server runs irc som its main asset is irclogs and irc configuration.

Takes backup to hosts/pi which server monitores daily.



## desktop

Main working station

Takes backup of local essentials to hosts/desktop which server monitores daily.

It copies backups to hosts/<hostname> of each host it monitores.

Desktop monitores the external production machines, including the router.
