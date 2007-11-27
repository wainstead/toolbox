#!/usr/bin/perl -w

use Sys::CpuLoad;

print '1 min, 5 min, 15 min load average: ',
              join(',', Sys::CpuLoad::load()), "\n";
