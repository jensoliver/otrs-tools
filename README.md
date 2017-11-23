OTRS-Tools
==========
In this repository I'm collecting some small tools, code snippets and proof of concept code which works with [OTRS](http://www.otrs.com).

You might find some more explanation on the usecases in the [OTRS Blog](https://blog.otrs.com/)

The usage of this code is at own risk.

Contents
========

IP DNSBL Check in the Information Floater
-----------------------------------------
[Blog entry](https://blog.otrs.com/2017/01/10/checking-ip-reputation-via-information-floater/)
- Kernel/Config/Files/ZZZIPCheck.pm
- bin/cgi-bin/dnsrbl.pl

Additional CMD Postmaster Filters:
----------------------------------
[Blog entry](https://blog.otrs.com/2016/12/21/using-postmaster-filters-raw-emails/)
- Kernel/Config/Files/PostMasterFilter.xml

Additional RSS Feeds in the Dashboard
-------------------------------------
[Blog entry](https://blog.otrs.com/2010/08/01/even-more-rss-feeds-in-sysconfig/)
- Kernel/Config/Files/CustomRSS.xml

Basic Installation of OTRS (Ubuntu) for lazy admins:
----------------------------------------------------
- otrs_install_ubuntu.sh

GIT post receive (or post merge) hook
----------------------------------------------------
- post-receive.pl
Needs to be copied to .git/hooks/post-receive.pl and symlinked to post-receive and/or post-merge
