# kexec

Quick workaround to be able to run kexec on RHCOS instances in order to quickly boot

First, fetch kexec using a prebuilt containr image (or build it yourself from this repo)
```
podman run --privileged --rm -v /usr/local/bin:/hostbin  quay.io/ohadlevy/kexec cp /kexec /hostbin 
```

run kexec

```
kexec --force --initrd initramfs.img --append 'mitigations=auto,nosmt systemd.unified_cgroup_hierarchy=0 coreos.liveiso=fedora-coreos-31.20200319.dev.1 rd.neednet=1 ip=dhcp ignition.firstboot ignition.platform.id=metal' vmlinuz
```
