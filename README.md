Siri Proxy
==========

About
-----
SiriLights is a plugin for siriproxy to control your X10 devices with siri via homeseer

Requirements
------------
X10 Controller CM12u/CM15/ETC
HomeSeer
tenHSserver - HomeSeer Plugin -  http://www.tenholder.net/tenWare2/tenHsServer/ 
TenHSserver Docs - http://www.tenholder.net/tenWare2/tenHsServer/Files/tenHsServer%20Documentation.pdf

Set-up Instructions
-------------------

**Video of a complete installation on Ubuntu 11.10 Is Coming Soon**



Install the plugin to the plugin directory

add the following info to config.yml
    - name: 'SiriLights'
      git: 'git://github.com/idarkside/siriproxy-sirilights.git'
      homeseer_ip: '192.168.0.18'
      rooms:
        a1: 'Living room'
        a2: 'Bedroom'

Licensing
---------

Re-use of my code is fine under a Creative Commons 3.0 [Non-commercial, Attribution, Share-Alike](http://creativecommons.org/licenses/by-nc-sa/3.0/) license. In short, this means that you can use my code, modify it, do anything you want. Just don't sell it and make sure to give me a shout-out. Also, you must license your derivatives under a compatible license (sorry, no closed-source derivatives). If you would like to purchase a more permissive license (for a closed-source and/or commercial license), please contact me directly. See the Creative Commons site for more information.


Disclaimer
----------
This software is provided as-is with no warranty whatsoever.

Also, this is my first project done in Ruby. Please don't be too critical of my code.