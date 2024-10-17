# vagrant
Vagrant for centos

To solve ==>  vagrant /sbin/mount.vboxsf: mounting failed with the error: No such device

    vagrant plugin install vagrant-vbguest
    vagrant vbguest
    vagrant halt
    vagrant up