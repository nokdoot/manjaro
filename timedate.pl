#!/usr/bin/env perl

use strict;
use warnings;

system "timedatectl set-timezone Asia/Seoul";
system "hwclock --systohc";
