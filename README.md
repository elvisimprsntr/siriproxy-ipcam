siriproxy-ipcam
===============

About
-----
Siriproxy-ipcam is a [SiriProxy] (https://github.com/plamoni/SiriProxy) plugin that allows you to push IP camera images to Apple's Siri interface on any iOS device that supports Siri.   It does not require a jailbreak, nor do I endorse doing so.

First, you must have SiriProxy installed and working.  [HOW-TOs for Siriprixy] (https://github.com/plamoni/SiriProxy/wiki/Installation-How-Tos) 

Second, you must have at least one IP camera on your local network that supports image/video streaming.  

Third, in order to support images from IP cameras requiring authentication, you need to have access to or set up a web server on your SiriProxy server to cache the camera image to push to Siri.  Simply type `apt-get install apache2 -y`.   The default configuration for APACHE will work.   SiriProxy will need write permission to the `/var/www/` folder, which if you are running SiriProxy as ROOT will be able to write the camera image. 

Here is a short demonstration video: Coming soon…   

I have received offers to make a donation to my project to help offset the cost of hardware and for my time.  If you feel so inclined you can donate thru PayPal.  

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4TRSKPQV8HCFY)

Cameras
-------

Hopefully the documentation for your IP camera provides the URL for grabbing a still image.  If not, while I have not found a single resource that documents all the make and model IP camera image URLs, this site is a good reference: http://www.ispyconnect.com/sources.aspx

BTW, The Windows open source [iSpy security camera software] (http://www.ispyconnect.com) is the best I have come across.  While there are no Mac OS X or Linux versions, the source code is avaiable and they are adding support mobile device HTML5 access.  

Installation
------------

- Navigate to the SiriProxy plugins directory  

`cd ~/SiriProxy/plugins/`

- Get the latest repo   

`wget "https://github.com/elvisimprsntr/siriproxy-ipcam/zipball/master"`

- Unzip the repo  

`unzip master`

- Create a symbolic link. **Note: Replace #'s as appropriate.**  

`ln -sf elvisimprsntr-siriproxy-ipcam-####### siriproxy-ipcam`

- Add the example configuration to the master config.yml  

`cat siriproxy-ipcam/config-info.yml >> ~/.siriproxy/config.yml`

- Edit the config.yml as required.     **Note: Make sure to line up the column spacing.**

`vim ~/.siriproxy/config.yml`

- Edit the plugin as you wish.  **Note: Repeat all the following steps if you make additional changes.**    

`vim siriproxy-ipcam\lib\siriproxy-ipcam.rb`

- Copy the repo and the symbolic link to the appropriate install directory.  **Note: Replace #'s as appropriate.  Replace /usr/local/rvm/ with ~/.rvm/ depending on your Linux distribution**     

`cp -rv elvisimprsntr-siriproxy-ipcam-####### /usr/local/rvm/gems/ruby-1.9.3-p###@SiriProxy/gems/siriproxy-0.3.#/plugins/`    
`cp -rv siriproxy-ipcam /usr/local/rvm/gems/ruby-1.9.3-p###@SiriProxy/gems/siriproxy-0.3.#/plugins/`    

- Navigate the SiriProxy directory  

`cd ~/SiriProxy`

- Bundle  

`siriproxy bundle`

- Install  

`bundle install`

- Run  

`rvmsudo siriproxy server`

Usage
-----

**Camera (name)**
- Pushes camera image to Siri  

To Do List
----------

Let me know if you want to collaborate.   

- Add ability to launch a live IP camera feed or at least provide a button to do so.

Licensing
---------

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).

