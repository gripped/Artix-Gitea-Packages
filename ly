type            = process
restart         = true
smooth-recovery = true
command         = /usr/bin/$EXE_NAME
depends-on      = loginready
termsignal      = HUP
# ly needs access to the console while loginready already occupies it
options         = shares-console
