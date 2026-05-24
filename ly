type            = process
command         = /usr/bin/ly-dm
smooth-recovery = true
depends-on      = login.target
logfile         = /var/log/dinit/ly.log
# ly needs access to the console while loginready already occupies it
options         = shares-console
