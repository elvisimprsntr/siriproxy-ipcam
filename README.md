siriproxy-picturejokes
======================

About
-----
Siriproxy-picturejokes is a [SiriProxy] (https://github.com/plamoni/SiriProxy) plugin that allows you to push cutom picture and text to Apple's Siri interface on any iOS device that supports Siri.   It does not require a jailbreak, nor do I endorse doing so.

First, you must have SiriProxy installed and working.  Second, you need to have access to or set up a web server on your SiriProxy server to host the custom pictures you want to push to Siri.  Simply type `apt-get install apache2`.   The default configuration for APACHE will work.   Your pictures need to reside in the `/var/www/` folder.  


A Bit on Pictures
-----------------
- Pictures that are at least 640 pixels in width with be centered on the screen.  iOS will resize wider photos to fit.  
- Pictures with 3x2 aspect ratio fill the screen, leaving room for the Siri bar.  
- iOS seems to support multiple picture formats.  I have have used jpg, jpeg, png files.  Not sure about other formats.  
- I have noticed pictures are antimated differently depending on the picture format.  Example: .png files rotate in.   .jpg file will scroll in.  I haven't explored using different file formats to see how they are antimated.  
- The pictures used in this example were rescalled from low quality images. Refrain from using copyprotected photos.  


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

Use your creativity.

To Do List
----------

- Make into a function to make it easier to add more jokes
- Add an example redirecting Siri to a YouTube video.  

Licensing
---------

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).

