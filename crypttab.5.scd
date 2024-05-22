crypttab(5) "cryptsetup" "cryptsetup manual"

# NAME

crypttab - static information about encrypted filesystems

# DESCRIPTION

The file /etc/crypttab contains descriptive information about encrypted devices.
crypttab is only read by init scripts, and not written; it is the duty of the
system administrator to properly create and maintain this file. crypttab entries
are treated sequentially, so their order matters (dependencies need to be listed
first).

Each encrypted device is described on a separate line. Fields on each line are
separated by tabs or spaces. Lines starting with # are comments, and blank
lines are ignored. Octal sequences \\0_num_ within a field are decoded, which
can be used for values containing spaces or special characters. A backslash
which doesn't start an octal sequence yields undefined behavior.

The first field, _target_, describes the mapped device name. It must be a
plain filename without any directory components. A mapped device which
encrypts/decrypts data to/from the _source device_ will be created at
/dev/mapper/target by *cryptsetup*.

The second field, _source device_, describes either the block special device
or file that contains the encrypted data. Instead of giving the _source
device_ explicitly, the UUID (resp. LABEL, PARTUUID and PARTLABEL) is
supported as well, using "UUID=<uuid>" (resp. "LABEL=<label>",
"PARTUUID=<partuuid>" and "PARTLABEL=<partlabel>".

The third field, _key file_, describes the file to use as a key for decrypting
the data of the _source device_. Note that the _entire_ key file will be used as
the passphrase; the passphrase must _not_ be followed by a newline character.

It can also be a device name (e.g. /dev/urandom), note however that LUKS
requires a persistent key and therefore does _not_ support random data keys.

If the _key file_ is the string _none_, a passphrase will be read interactively
from the console. In this case, the option tries may be useful.

The fourth field, _options_, is an optional comma-separated list of options
and/or flags describing the device type (_luks_, _tcrypt_, _bitlk_, _fvault2_,
or _plain_) and cryptsetup options associated with the encryption process. The
supported options are described below. For plain dm-crypt devices the _cipher_,
_hash_ and _size_ options are required. Some options can be changed on active
mappings using *cryptsetup refresh [<options>] <name>*. Furthermore some
options can be permanently written into metadata of LUKS2 headers using
cryptsetup's _--persistent_ flag.

Note that the first three fields are required and that a missing field will lead
to unspecified behaviour.

# ON DIFFERENT CRYPTTAB FORMATS

Please note that there are several independent cryptsetup wrappers with their
own _crypttab_ format. This manpage covers Artix's implementation for
_dinit_ and _s6_ service scripts. _OpenRC_ doesn't read _crypttab_ but has an
equivalent through /etc/conf.d/dmcrypt.

# OPTIONS

_cipher_=<cipher>
	Encryption algorithm (ignored for non-PLAIN devices). See *cryptsetup -c*.

_size_=<size>
	Encryption key size (ignored for non-PLAIN devices). See *cryptsetup -s*.

_sector-size_=<bytes>
	Sector size. See *cryptsetup*(8) for possible values and the default value of this option.

_hash_=<hash>
	Hash algorithm (ignored for non-PLAIN devices). See *cryptsetup -h*.

_offset_=<offset>
	Start offset (ignored for non-PLAIN devices). Uses *cryptsetup -o*.
	
_skip_=<skip>
	Skip sectors at the beginning (ignored for non-PLAIN devices). Uses*cryptsetup -p*.

_keyfile-offset_=<keyfile-offset>
	Specifies the number of bytes to skip at the start of the key file.

_keyfile-size_=<keyfile-size>
	Specifies the maximum number of bytes to read from the key file. The

	default is to read the whole file up to the compiled-in maximum, that
	can be queried with *cryptsetup --help*. This option is ignored for
	plain dm-crypt devices, as the key file size is then given by the
	encryption key size (option _size_).

_keyslot_=<slot>, _key-slot_=<slot>
	Key slot (ignored for non-LUKS devices). See *cryptsetup -S*.

_header_=<path>
	Detached header file (ignored for plain dm-crypt devices). See *cryptsetup --header*.

_verify_
	Verify password. Uses *cryptsetup -y*.

_readonly_, _read-only_
	Set up a read-only mapping.

_tries_=<num>
	Try to unlock the device <num> before failing. It's particularly useful

	when using a passphrase or a _keyscript_ that asks for interactive
	input. If you want to disable retries, pass "tries=1". Default is "3".
	Setting "tries=0" means infinitive retries.

_discard_
	Allow using of discards (TRIM) requests for device.

	If you don't care about leaking access patterns (filesystem type, used
	space) and don't have hidden truecrypt volumes inside this volume, then
	it should be safe to enable this option. See the following warning for
	further information.

	*WARNING*: Assess the specific security risks carefully before enabling
	this option. For example, allowing discards on encrypted devices may
	lead to the leak of information about the ciphertext device (filesystem
	type, used space etc.) if the discarded blocks can be located easily on
	the device later.

_luks_
	Force LUKS mode. When this mode is used, the following options are
	ignored since they are provided by the LUKS header on the device:
	_cipher=_, _hash=_, _size=_

_plain_
	Force plain encryption mode.

_bitlk_
	Force BITLK (Windows BitLocker-compatible) mode.

	WARNING: _crypttab_ support is currently experimental.

_fvault2_
	Force Apple's FileVault2 mode. Only the (legacy) FileVault2 format based
	on Core Storage and HFS+ filesystem (introduced in MacOS X 10.7 Lion) is
	currently supported; the new version of FileVault based on the APFS
	filesystem used in recent macOS versions is not supported.

	WARNING: _crypttab_ support is currently experimental.

_tcrypt_
	Use TrueCrypt encryption mode. When this mode is used, the following
	options are ignored since they are provided by the TrueCrypt header on
	the device or do not apply: _cipher=_, _hash=_, _keyfile-offset=_,
	_keyfile-size=_, _size=_.

	WARNING: _crypttab_ support is currently experimental.

_veracrypt_, _tcrypt-veracrypt_
	Use VeraCrypt extension to TrueCrypt device. Only useful in conjunction
	with _tcrypt_ option (ignored for non-TrueCrypt devices).

_tcrypthidden_, _tcrypt-hidden_
	Use hidden TCRYPT header (ignored for non-TCRYPT devices).

_swap_
	Run *mkswap* on the created device.

_tmp_[=<tmpfs>]
	Run mkfs with filesystem type <tmpfs> (or ext4 if omitted) on the created device.

_check_[=<check>]
	Check the content of the target device by a suitable program; if the check
	fails, the device is closed immediately. The program is being run with
	decrypted volume (target device) as first positional argument and, if the
	checkargs option is used, its value as second argument. See the CHECKSCRIPTS
	section for more information.

	The program is either specified by full path or relative to
	/lib/cryptsetup/checks/. If omitted, then the value of $CRYPTDISKS_CHECK set
	in /etc/default/cryptdisks is used (blkid by default).

_checkargs_=<arguments>
	Give <arguments> as the second argument to the check script. See the
	CHECKSCRIPTS section for more information.

_noearly_
	The cryptsetup init scripts are invoked twice during the boot process - once
	before lvm, raid, etc. are started and once again after that. Sometimes you
	need to start your encrypted disks in a special order. With this option the
	device is ignored during the first invocation of the cryptsetup init
	scripts.

_noauto_
	Entirely ignore the device at the boot process. It's still possible to map
	the device manually using cryptdisks_start.

_loud_
	Be loud. Print warnings if a device does not exist. This option overrides
	the option _quiet_.

_quiet_
	Be quiet. Don't print warnings if a device does not exist. This option
	overrides the option _loud_.

_keyscript_=<path>
	The executable at the indicated path is executed with the value of the _third
	field_ as only argument. The keyscript's standard output is passed to
	cryptsetup as decyption key. Its exit status is currently ignored, but no
	assumption should be made in that regard. When used in initramfs, the
	executable either needs to be self-contained (i.e. doesn't rely on any
	external program which is not present in the initramfs environment) or the
	dependencies have to added to the initramfs image by other means. The
	program is either specified by full path or relative to
	/usr/lib/cryptsetup/scripts/.

	LIMITATIONS: All binaries and files on which the keyscript depends must be
	available at the time of execution. Special care needs to be taken for
	encrypted filesystems like /usr or /var. As an example, unlocking encrypted
	/usr must not depend on binaries from /usr/(s)bin.

# CHECKSCRIPTS

_blkid_
	Checks for any known filesystem. Supports a filesystem type as argument via
	<checkargs>:

	- no checkargs - succeeds if any valid filesystem is found on the device.

	- "none" - succeeds if no valid filesystem is found on the device.

	- "ext4" [or another filesystem type like xfs, swap, crypto_LUKS, ...] - succeeds if ext4 filesystem is found on the device.

_unblkid_
	Checks for no known filesystem. Supports a filesystem type as argument via

	<checkargs>:

	- no checkargs - succeeds if no valid filesystem is found on the device.

	- "ext4" [or another filesystem type like xfs, swap, crypto_LUKS, ...] - succeeds if no ext4 filesystem is found on the device.

# EXAMPLES

```
	# Encrypted swap device
	cswap /dev/sda6 /dev/urandom plain,cipher=aes-xts-plain64,size=256,hash=sha1,swap

	# Encrypted LUKS disk with interactive password, identified by its UUID, discard enabled
	cdisk0 UUID=12345678-9abc-def012345-6789abcdef01 none luks,discard

	# Encrypted TCRYPT disk with interactive password, discard enabled
	tdisk0 /dev/sr0 none tcrypt,discard

	# Encrypted ext4 disk with interactive password, discard enabled
	# - retry 5 times if the check fails
	cdisk1 /dev/sda2 - plain,cipher=aes-xts-plain64,size=256,hash=sha1,tries=5,discard

	# Encrypted disk with interactive password, discard enabled
	# - no retries
	cdisk2 /dev/sdc1 none plain,cipher=aes-xts-plain64,size=256,hash=sha1,tries=1,discard

	# Encrypted disk with interactive password, discard enabled
	# - Twofish as the cipher, RIPEMD-160 as the hash
	cdisk3 /dev/sda3 none plain,cipher=twofish,size=256,hash=ripemd160,discard
```

# KNOWN UPGRADE ISSUES

	The upstream defaults for encryption cipher, hash and keysize have
	changed several times in the past, and they're expected to change again
	in future, forexample if security issues arise. On LUKS devices, the
	used settings are stored in the LUKS header, and thus don't need to be
	configured in /etc/crypttab. For plain dm-crypt devices, no information
	about used cipher, hash and keysize are available at all. Therefore we
	strongly suggest to configure the cipher, hash and keysize in
	/etc/crypttab for plain dm-crypt devices, even if they match the current
	default.

# SEE ALSO

	*cryptsetup*(8)

# AUTHOR

	This manual page was originally written by Bastian Kleineidam
	<calvin@debian.org> for the Debian distribution of cryptsetup. and has
	been further improved by Michael Gebetsroither <michael.geb@gmx.at>,
	David Härdeman <david@hardeman.nu> and Jonas Meurer
	<jonas@freesources.org>. This manual page has been rewritten in scdoc
	format by Muhammad Herdiansyah <koni@artixlinux.org> for easier
	maintenance and to adapt it to Artix's current implementation of
	crypttab script.

	NOTE: The original author originally licensed this manual page under
	GPL-2.0-or-later license. Any modifications will follow the original
	license.
