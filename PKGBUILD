# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Sébastien Luttringer
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname=filesystem
pkgver=2024.04.07
pkgrel=1
pkgdesc='Base Artix Linux files'
arch=('any')
license=('GPL-3.0-or-later')
url='https://www.artixlinux.org'
depends=('iana-etc')
backup=(
  'etc/crypttab'
  'etc/fstab'
  'etc/group'
  'etc/gshadow'
  'etc/host.conf'
  'etc/hosts'
  'etc/issue'
  'etc/ld.so.conf'
  'etc/nsswitch.conf'
  'etc/passwd'
  'etc/profile'
  'etc/resolv.conf'
  'etc/securetty'
  'etc/shadow'
  'etc/shells'
  'etc/subgid'
  'etc/subuid'
)
source=(
  'artix-release'
  'artixlinux-logo.png'
  'artixlinux-logo.svg'
  'artixlinux-logo-text.svg'
  'artixlinux-logo-text-dark.svg'
  'crypttab'
  'fstab'
  'group'
  'gshadow'
  'host.conf'
  'hosts'
  'issue'
  'ld.so.conf'
  'locale.sh'
  'nsswitch.conf'
  'os-release'
  'passwd'
  'profile'
  'resolv.conf'
  'securetty'
  'shadow'
  'shells'
  'sysctl'
  'sysusers'
  'tmpfiles'
  'subgid'
  'subuid'
)
sha256sums=('01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b'
            '5e18ee2e133c8129648af0e4e276a04722f6443977d2b1b552560e10d6e95b1e'
            '901f30173e8044f489b6224dde41fb6d15244968abad17c37763b5c063834a4e'
            '9bc8bee1285a8688440f587a5f57de2371f2ba22c3268d33379073482cc492f1'
            '9bc8bee1285a8688440f587a5f57de2371f2ba22c3268d33379073482cc492f1'
            'e03bede3d258d680548696623d5979c6edf03272e801a813c81ba5a5c64f4f82'
            'e54626e74ed8fee4173b62a545ab1c3a3a069e4217a0ee8fc398d9933e9c1696'
            '244f0718ee2a9d6862ae59d6c18c1dd1568651eada91a704574fa527fbac2b3a'
            '90d879374f77bac47f132164c1e7fc4892e994ff1d1ac376efa0c1c26ea37273'
            '4d7b647169063dfedbff5e1e22cee77bd1a4183dbcfd5e802e68939da4bbf733'
            'd9cd8a77d9e0aa5e90d7f4ed74c8745c17b525e720e28e4c44364150003c35f9'
            '9e5f1c492e6ad1c246ae71a55a4ff0eca9909bbbc2c6034fd70f31ab86c868eb'
            '785c6c3614a27ae6115a27c1ca55bbf333654780997c4ba7e181172b021d1bf3'
            '8ca2d8eef6fb5143c9ef7e9174ccfef59ac7ad2deee243574cd10c763156cc10'
            '62855224620a1e6dcfb2373460387bf0b7870ebe0595a61bbbc74919710d7641'
            '1aa33ce150ddb33b815f0b45425948e16020fcfb0a54ecc997b49778d5643978'
            '13e2783884783ef46b8345fbcdf7880f0414c0a9c42e2b2fc6a2b048cbc2d86e'
            'ad6919a8d79b8f91ad77b49fa56afeb86725659a73a32ce61c574633221c64d3'
            '5557d8e601b17a80d1ea7de78a9869be69637cb6a02fbfe334e22fdf64e61d4c'
            'd88be2b45b43605ff31dd83d6a138069b6c2e92bc8989b7b9ab9eba8da5f8c7b'
            '6e13705ac4d6f69cdba118c6b70c722346fd3c45224133e6bbfe28aca719563c'
            'ec289c03aa0d150e90e8287f001c8e6552ab9dd54f450bdb5c2d2254e477965b'
            '1a1f39695826ca8d5e33ac5801c21f17c6e1d0593b281a1e77be099d454d9715'
            '7a278856af667f4e8902502453c008ceb16ddfb4a7c3e553de8e4d1afde00156'
            'a2eb2324ba281a87f8fec77ad4bdcb49d3fb3bfbc2e5862fd17602307e11d3e6'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
  local group link mode source_file user
  declare -A directories
  declare -A files
  declare -A symlinks

  # associative array with directories and their assigned mode, user and group
  # all paths are relative to the root directory /
  directories=(
    ["boot"]="755:0:0"
    ["dev"]="755:0:0"
    ["etc"]="755:0:0"
    ["etc/ld.so.conf.d"]="755:0:0"
    ["etc/profile.d"]="755:0:0"
    ["etc/skel"]="755:0:0"
    ["home"]="755:0:0"
    ["mnt"]="755:0:0"
    ["opt"]="755:0:0"
    ["proc"]="555:0:0"
    ["root"]="0750:0:0"
    ["run"]="755:0:0"
    ["srv/http"]="755:0:0"
    ["srv/ftp"]="555:0:11"  # vsftpd won't run with write perms on /srv/ftp
    ["sys"]="555:0:0"
    ["tmp"]="1777:0:0"
    ["usr"]="755:0:0"
    ["usr/bin"]="755:0:0"
    ["usr/include"]="755:0:0"
    ["usr/lib"]="755:0:0"
    ["usr/lib/ld.so.conf.d"]="755:0:0"
    ["usr/local/bin"]="755:0:0"
    ["usr/local/etc"]="755:0:0"
    ["usr/local/games"]="755:0:0"
    ["usr/local/include"]="755:0:0"
    ["usr/local/lib"]="755:0:0"
    ["usr/local/man"]="755:0:0"
    ["usr/local/sbin"]="755:0:0"
    ["usr/local/share"]="755:0:0"
    ["usr/local/src"]="755:0:0"
    ["usr/share/factory/etc"]="755:0:0"
    ["usr/share/man/man1"]="755:0:0"
    ["usr/share/man/man2"]="755:0:0"
    ["usr/share/man/man3"]="755:0:0"
    ["usr/share/man/man4"]="755:0:0"
    ["usr/share/man/man5"]="755:0:0"
    ["usr/share/man/man6"]="755:0:0"
    ["usr/share/man/man7"]="755:0:0"
    ["usr/share/man/man8"]="755:0:0"
    ["usr/share/misc"]="755:0:0"
    ["usr/share/pixmaps"]="755:0:0"
    ["usr/src"]="755:0:0"
    ["var"]="755:0:0"
    ["var/cache"]="755:0:0"
    ["var/empty"]="755:0:0"
    ["var/games"]="775:0:50"  # allow setgid games (gid 50) to write scores
    ["var/lib/misc"]="755:0:0"
    ["var/local"]="755:0:0"
    ["var/log/old"]="755:0:0"
    ["var/opt"]="755:0:0"
    ["var/spool/mail"]="1777:0:0"
    ["var/tmp"]="1777:0:0"
  )

  # associative array with symlink names and their respective targets
  # all paths are relative to the root directory /
  symlinks=(
    ["bin"]="usr/bin"
    ["etc/mtab"]="../proc/self/mounts"
    ["lib"]="usr/lib"
    ["sbin"]="usr/bin"
    ["usr/local/share/man"]="../man"
    ["usr/sbin"]="bin"
    ["var/lock"]="../run/lock"
    ["var/mail"]="spool/mail"
    ["var/run"]="../run"
  )
  [[ $CARCH = 'x86_64' ]] && {
    symlinks["lib64"]="usr/lib"
    symlinks["usr/lib64"]="lib"
  }

  # associative array of target files, their source file, file mode, user and group ownership
  files=(
    ["etc/artix-release"]="artix-release:644:0:0"
    ["etc/crypttab"]="crypttab:600:0:0"
    ["etc/fstab"]="fstab:644:0:0"
    ["etc/group"]="group:644:0:0"
    ["etc/gshadow"]="gshadow:600:0:0"
    ["etc/host.conf"]="host.conf:644:0:0"
    ["etc/hosts"]="hosts:644:0:0"
    ["etc/issue"]="issue:644:0:0"
    ["etc/ld.so.conf"]="ld.so.conf:644:0:0"
    ["etc/nsswitch.conf"]="nsswitch.conf:644:0:0"
    ["etc/passwd"]="passwd:644:0:0"
    ["etc/profile"]="profile:644:0:0"
    ["etc/profile.d/locale.sh"]="locale.sh:644:0:0"
    ["etc/resolv.conf"]="resolv.conf:644:0:0"
    ["etc/securetty"]="securetty:644:0:0"
    ["etc/shells"]="shells:644:0:0"
    ["etc/shadow"]="shadow:600:0:0"
    ["etc/subgid"]="subgid:644:0:0"
    ["etc/subuid"]="subuid:644:0:0"
    ["usr/lib/os-release"]="os-release:644:0:0"
    ["usr/lib/sysctl.d/10-artix.conf"]="sysctl:644:0:0"
    ["usr/lib/sysusers.d/artix.conf"]="sysusers:644:0:0"
    ["usr/lib/tmpfiles.d/artix.conf"]="tmpfiles:644:0:0"
    ["usr/share/factory/etc/artix-release"]="artix-release:644:0:0"
    ["usr/share/factory/etc/crypttab"]="crypttab:600:0:0"
    ["usr/share/factory/etc/fstab"]="fstab:644:0:0"
    ["usr/share/factory/etc/group"]="group:644:0:0"
    ["usr/share/factory/etc/gshadow"]="gshadow:600:0:0"
    ["usr/share/factory/etc/host.conf"]="host.conf:644:0:0"
    ["usr/share/factory/etc/hosts"]="hosts:644:0:0"
    ["usr/share/factory/etc/issue"]="issue:644:0:0"
    ["usr/share/factory/etc/ld.so.conf"]="ld.so.conf:644:0:0"
    ["usr/share/factory/etc/nsswitch.conf"]="nsswitch.conf:644:0:0"
    ["usr/share/factory/etc/passwd"]="passwd:644:0:0"
    ["usr/share/factory/etc/profile"]="profile:644:0:0"
    ["usr/share/factory/etc/profile.d/locale.sh"]="locale.sh:644:0:0"
    ["usr/share/factory/etc/resolv.conf"]="resolv.conf:644:0:0"
    ["usr/share/factory/etc/securetty"]="securetty:644:0:0"
    ["usr/share/factory/etc/shadow"]="shadow:600:0:0"
    ["usr/share/factory/etc/shells"]="shells:644:0:0"
    ["usr/share/factory/etc/subgid"]="subgid:644:0:0"
    ["usr/share/factory/etc/subuid"]="subuid:644:0:0"
    ["usr/share/pixmaps/artixlinux-logo.png"]="artixlinux-logo.png:644:0:0"
    ["usr/share/pixmaps/artixlinux-logo.svg"]="artixlinux-logo.svg:644:0:0"
    ["usr/share/pixmaps/artixlinux-logo-text.svg"]="artixlinux-logo-text.svg:644:0:0"
    ["usr/share/pixmaps/artixlinux-logo-text-dark.svg"]="artixlinux-logo-text-dark.svg:644:0:0"
  )

  cd "$pkgdir"

  for dir in "${!directories[@]}"; do
    mode="$(cut -f 1 -d ':' <<< "${directories[$dir]}")"
    user="$(cut -f 2 -d ':' <<< "${directories[$dir]}")"
    group="$(cut -f 3 -d ':' <<< "${directories[$dir]}")"

    install -vdm "$mode" -o "$user" -g "$group" "$dir"
  done

  for link in "${!symlinks[@]}"; do
    ln -sv "${symlinks[$link]}" "$link"
  done

  for target_file in "${!files[@]}"; do
    source_file="$(cut -f 1 -d ':' <<< "${files[$target_file]}")"
    mode="$(cut -f 2 -d ':' <<< "${files[$target_file]}")"
    user="$(cut -f 3 -d ':' <<< "${files[$target_file]}")"
    group="$(cut -f 4 -d ':' <<< "${files[$target_file]}")"

    install -vDm "$mode" -o "$user" -g "$group" "$srcdir/$source_file" "$target_file"
  done
}

# vim:set ts=2 sw=2 et:
