siriproxy-picturejokes
======================

About
-----
Siriproxy-picturejokes is a [SiriProxy] (https://github.com/plamoni/SiriProxy) plugin that allows you to push custom pictures and text to Apple's Siri interface on any iOS device that supports Siri.   It does not require a jailbreak, nor do I endorse doing so.

First, you must have SiriProxy installed and working.  

Second, you need to have access to or set up a web server on your SiriProxy server to host the custom pictures you want to push to Siri.  Simply type `apt-get install apache2`.   The default configuration for APACHE will work.   Your pictures need to reside in the `/var/www/` folder.  

Third, if you VPN into your home network and configure your iOS device to route all traffic through the VPN connection you can get lots of laughs at your local pub.  See the Wiki page for links to how I set up a VPN using my home router. 




Pictures
-----------------
- Pictures at least 640 pixels in width will be centered on the screen.  iOS will resize wider pictures to fit.  
- Pictures with 2x3 portrait aspect ratio fill the screen, leaving just enough room for the Siri bar.  
- iOS seems to support multiple picture formats.  I have not used JPG, JPEG, and PNG files.  Not sure about other formats.  
- Pictures are antimated differently depending on picture format.  Example: PNG files rotate in.   JPG files will scroll in.  I haven't compared other picture formats.
- Pictures used in this example are intentionally not provided. Refrain from using copyprotected photos.  


Installation
------------


- Navigate to the SiriProxy plugins directory  

`cd ~/SiriProxy/plugins/`

- Get the latest repo   

`wget "https://github.com/elvisimprsntr/siriproxy-picturejokes/zipball/master"`

- Unzip the repo  

`unzip master`

- Create a symbolic link. **Note: Replace #'s as appropriate.**  

`ln -sf elvisimprsntr-siriproxy-picturejokes-####### siriproxy-picturejokes`

- Add the example configuration to the master config.yml  

`cat siriproxy-picturejokes/config-info.yml >> ~/.siriproxy/config.yml`

- Edit the config.yml as required.     **Note: Make sure to line up the column spacing.**

`vim ~/.siriproxy/config.yml`

- Edit the plugin as you wish  

`vim siriproxy-picturejokes\lib\siriproxy-picturejokes.rb`

- Copy the repo and the symbolic link to the appropriate install directory.  **Note: Replace #'s as appropriate.  Replace /usr/local/rvm/ with ~/.rvm/ depending on your Linux distribution**     

`cp -rv elvisimprsntr-siriproxy-picturejokes-####### /usr/local/rvm/gems/ruby-1.9.3-p###@SiriProxy/gems/siriproxy-0.3.#/plugins/`    
`cp -rv siriproxy-picturejokes /usr/local/rvm/gems/ruby-1.9.3-p###@SiriProxy/gems/siriproxy-0.3.#/plugins/`    

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

Limited only by your imagination.

To Do List
----------

- Make into a function to make it easier to add more jokes
- Add an example redirecting Siri to a YouTube video.  The idea is to RickRoll someone based on particular keywords.

Licensing
---------

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).

