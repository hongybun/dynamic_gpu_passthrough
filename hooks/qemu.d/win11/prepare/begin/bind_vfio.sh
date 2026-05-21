#!/usr/bin/env bash
set -e
source "/etc/libvirt/hooks/kvm.conf"

if fuser /dev/nvidia* >/dev/null 2>&1; then
  echo "NVIDIA GPU is still in use; refusing passthrough to avoid host crash." >&2
  fuser -v /dev/nvidia* >&2 || true
  exit 1
fi

bind_vfio
