#!/usr/bin/perl

print <<EOLN;
System Information at  9:55:20 Tue May  8, 2007

Alteon 180e
sysName:     fc-alt-1
sysLocation: 85 10th Ave NYC

Switch is up 11 days, 10 hours, 50 minutes and 8 seconds.
Last boot: 23:05:10 Thu Apr 26, 2007 (reset from console)

MAC address: 00:60:cf:46:f3:10    IP (If 1) address: 4.78.165.126
Hardware Revision: B
Hardware Part No: B05_5A-D_7B-A
Software Version 10.0.33.4-SSH (FLASH image1), active configuration.

Welcome to fc-alt-1!

------------------------------------------------------------
[Main Menu]
      info    - Information Menu
      stats   - Statistics Menu
      cfg     - Configuration Menu
      oper    - Operations Command Menu
      boot    - Boot Options Menu
      maint   - Maintenance Menu
      diff    - Show pending config changes  [global command]
      apply   - Apply pending config changes [global command]
      save    - Save updated config to FLASH [global command]
      revert  - Revert pending or applied changes [global command]
      exit    - Exit  [global command, always available]

>> fc-alt-1 - Main# stats/slb/maint
------------------------------------------------------------------
SLB Maintenance stats:
Maximum sessions:                172032
Current sessions:                  3059
  4 second average:                3093
64 second average:                3185
Terminated sessions:                167
Allocation failures:                  0
TCP fragments:                     3953
UDP datagrams:                      830
Non TCP/IP frames:                 1156
Incorrect VIPs:                  481487
Incorrect Vports:               1083984
No available real server:             0
Backup server activations:            0
Overflow server activations:          0
Filtered (denied) frames:             0
VMA discards:                       484
Bad buffer copies:                    0
Hash chain loops:                     0


EOLN
