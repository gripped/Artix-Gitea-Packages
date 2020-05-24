/var/log/lighttpd/*log {
	missingok
	copytruncate
	notifempty
	sharedscripts
	postrotate
		[ -f /usr/bin/openrc ]	&& { rc-service lighttpd reload } || true
		[ -f /usr/bin/runit ] && { sv restart lighttpd } || true
		[ -f /usr/bin/s6-svc ] && { s6-rc -d lighttpd && s6-rc -u lighttpd } || true
	endscript
}
