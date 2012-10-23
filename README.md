1. Navigate to the SiriProxy plugins directory

`cd ~/SiriProxy/plugins/`

2. Get the latest repo

`wget "https://github.com/elvisimprsntr/siriproxy-picturejokes/zipball/master"`

3 Unzip the repo

`unzip master`

4. Create a symbolic link

`ln -sf elvisimprsntr-siriproxy-picturejokes-####### siriproxy-picturejokes`

5. Add the example configuration to the master config.yml

`cat siriproxy-picturejokes/config_info.yml >> ~/SiriProxy/config.yml`

6. Edit the config.yml as required

`vim ~/SiriProxy/config.yml`

7. Edit the plugin as you wish

`vim siriproxy-picturejokes\lib\siriproxy-picturejokes.rb`

8. Copy the repo and the symbolic link to the appropriate install directory

`cp -rv elvisimprsntr-siriproxy-picturejokes-####### /usr/local/rvm/gems/ruby-1.9.3-p286@SiriProxy/gems/siriproxy-0.3.2/plugins/`
`cp -rv siriproxy-picturejokes /usr/local/rvm/gems/ruby-1.9.3-p286@SiriProxy/gems/siriproxy-0.3.2/plugins/`

9. Navigate the SiriProxy directory

`cd ~/SiriProxy`

10. Bundle

`siriproxy bundle`

11. Install

`bundle install`

12. Run

`rvmsudo siriproxy server`

