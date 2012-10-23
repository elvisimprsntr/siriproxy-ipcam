- Navigate to the SiriProxy plugins directory  

`cd ~/SiriProxy/plugins/`

- Get the latest repo   

`wget "https://github.com/elvisimprsntr/siriproxy-picturejokes/zipball/master"`

- Unzip the repo  

`unzip master`

- Create a symbolic link  

`ln -sf elvisimprsntr-siriproxy-picturejokes-####### siriproxy-picturejokes`

- Add the example configuration to the master config.yml  

`cat siriproxy-picturejokes/config-info.yml >> ~/.siriproxy/config.yml`

- Edit the config.yml as required  

`vim ~/.siriproxy/config.yml`

- Edit the plugin as you wish  

`vim siriproxy-picturejokes\lib\siriproxy-picturejokes.rb`

- Copy the repo and the symbolic link to the appropriate install directory    

`cp -rv elvisimprsntr-siriproxy-picturejokes-####### /usr/local/rvm/gems/ruby-1.9.3-p286@SiriProxy/gems/siriproxy-0.3.2/plugins/`  
`cp -rv siriproxy-picturejokes /usr/local/rvm/gems/ruby-1.9.3-p286@SiriProxy/gems/siriproxy-0.3.2/plugins/`  

- Navigate the SiriProxy directory  

`cd ~/SiriProxy`

- Bundle  

`siriproxy bundle`

- Install  

`bundle install`

- Run  

`rvmsudo siriproxy server`

