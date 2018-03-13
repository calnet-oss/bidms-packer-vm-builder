#!/bin/sh

qemu-system-x86_64 \
  -m 2048M \
  -netdev user,id=user.0,hostfwd=tcp::3433-:22 \
  -device virtio-net,netdev=user.0 \
  -enable-kvm \
  -cpu host \
  -rtc base=localtime \
  -vnc 127.0.0.1:59 \
  -name bidms \
  -machine type=pc,accel=kvm \
  -drive file=output-qemu/bidms.qcow2,if=virtio,cache=writeback,discard=ignore,format=qcow2 \
  -device virtio-serial \
  -chardev socket,path=/tmp/bidms-virtconsole,server,nowait,id=bidms-virtconsole \
  -device virtserialport,chardev=bidms-virtconsole,name=org.qemu.guest_agent.0
