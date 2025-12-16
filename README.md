Each package repo is a branch.  

Modified from the [Arch wiki](https://wiki.archlinux.org/title/Arch_User_Repository?utm_source=chatgpt.com#Acquire_build_files)  


Use the read-only mirror Artix-Gitea-Packages on GitHub,  where every package is located in a branch.  
It is recommended to clone only a single branch (the whole repository is too big and performance would be low).  

You can do this with one of the following two methods:  
Use `git clone --single-branch`: 

    $ git clone --branch package_name --single-branch https://github.com/gripped/Artix-Gitea-Packages.git

Do a partial clone of this repository (`git clone --depth=1`) and add branches selectively:

    $ git clone --depth=1 https://github.com/gripped/Artix-Gitea-Packages; cd aur
    $ git remote set-branches --add origin package_name
    $ git fetch
    $ git switch package_name

