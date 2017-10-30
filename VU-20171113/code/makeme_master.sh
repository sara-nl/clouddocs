#! /bin/bash
NEW_HOSTNAME="master"

hostnamectl set-hostname "$NEW_HOSTNAME"
exec bash
