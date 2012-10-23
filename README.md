> cd ~/SiriProxy/plugins/

> wget "https://github.com/elvisimprsntr/siriproxy-picturejokes/zipball/master"

> unzip master

> ln -sf elvisimprsntr-siriproxy-picturejokes-####### siriproxy-picturejokes

> cat siriproxy-picturejokes/config_info.yml >> ~/SiriProxy/config.yml 

> cp -rv elvisimprsntr-siriproxy-picturejokes-####### /usr/local/rvm/gems/ruby-1.9.3-p286@SiriProxy/gems/siriproxy-0.3.2/plugins/
> cp -rv siriproxy-picturejokes /usr/local/rvm/gems/ruby-1.9.3-p286@SiriProxy/gems/siriproxy-0.3.2/plugins/

> cd ~/SiriProxy

> siriproxy bundle

> bundle install

> rvmsudo siriproxy server

