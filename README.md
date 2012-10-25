siriproxy-ipcam
===============

About
-----
Siriproxy-ipcam is a [SiriProxy] (https://github.com/plamoni/SiriProxy) plugin that allows you to push IP camera images to Apple's Siri interface on any iOS device that supports Siri.   It does not require a jailbreak, nor do I endorse doing so.

First, you must have SiriProxy installed and working.  

Here is a short demonstration video: Coming soon…   

Cameras
-------

Hopefully the documentation for your IP camera provides the URL for grabbing a still image.  If not, while I have not found a single resource that documents all the make and model IP camera image URLs, this site is a good reference: http://www.ispyconnect.com/sources.aspx

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

- Edit the plugin as you wish.  **Note: If you make additional changes, you need to repeat all the following steps.**   

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

Limited only by your imagination.

To Do List
----------

- Add authenticated IP camera access.
- Add ability to launch a live IP camera feed or at least provide a button to do so.

Licensing
---------

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).

