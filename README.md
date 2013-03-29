siriproxy-ipcam
===============

About
-----
Siriproxy-ipcam is a [SiriProxy] (https://github.com/plamoni/SiriProxy) plugin that allows you to push IP camera images to Apple's Siri interface on any iOS device that supports Siri.   It does not require a jailbreak, nor do I endorse doing so.

First, you must have SiriProxy installed and working.  [HOW-TOs for SiriProxy] (https://github.com/plamoni/SiriProxy/wiki/Installation-How-Tos) 

Second, you must have at least one IP camera on your local network that supports image/video streaming.  

Third, in order to support images from IP cameras requiring authentication, you need to have access to or set up a web server on your SiriProxy server to cache the camera image to push to Siri.  Simply type `apt-get install apache2 -y`.   The default configuration for APACHE will work.   SiriProxy will need write permission to the `/var/www/` folder, which if you are running SiriProxy as ROOT will be able to write the camera image. 

[Watch Demo Video](http://www.youtube.com/watch?v=YZHbO-sdUOY) 

[![Video](http://img.youtube.com/vi/YZHbO-sdUOY/hqdefault.jpg)](http://www.youtube.com/watch?v=YZHbO-sdUOY)

I have received offers to make a donation to help offset the cost of hardware and for my time.  If you feel so inclined you can donate thru PayPal.  

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SB6A4AFSC5LFQ)

Cameras
-------

Hopefully the documentation for your IP camera provides the URL for grabbing a still image.  If not, while I have not found a single resource that documents all the make and model IP camera image URLs, this site is a good reference: http://www.ispyconnect.com/sources.aspx

BTW, The Windows open source [iSpy security camera software] (http://www.ispyconnect.com) is the best I have come across.  While there are no Mac OS X or Linux versions, the source code is avaiable and they are adding support mobile device HTML5 access.  

Installation (New for SiriProxy 0.5.0+)
---------------------------------------


- Create a plugins directory  

`mkdir ~/plugins`  

`cd ~/plugins/` 

- Get the latest repo   

`git clone git://github.com/elvisimprsntr/siriproxy-ipcam`

- Add the example configuration to the master config.yml  

`cat siriproxy-ipcam/config-info.yml >> ~/.siriproxy/config.yml`

- Edit the config.yml as required.     **Note: Make sure to line up the column spacing.**

`vim ~/.siriproxy/config.yml`

- Edit the plugin as you wish.  **Note: Repeat all the following steps if you make additional changes.**    

`vim siriproxy-ipcam/lib/siriproxy-ipcam.rb`

- Bundle  

`siriproxy bundle`

- Run (Ref: https://github.com/plamoni/SiriProxy#set-up-instructions)  

`[rvmsudo] siriproxy server [-d ###.###.###.###] [-u username]`


Usage
-----

**Camera (name)**
- Pushes camera image to Siri  

**Check cameras**
- Pushes all cameras to Siri  


To Do List
----------

If you want to collaborate, review the issues list for things to implement.  Fork, modify, test, and submit a pull request.

Licensing
---------

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).

