require 'siri_objects'
require 'cgi'

class SiriProxy::Plugin::IPCam < SiriProxy::Plugin
  attr_accessor :camip1
  attr_accessor :camip2
  attr_accessor :camip3
  attr_accessor :camip4

  def initialize(config)
    self.camip1 = config["camip1"]
    self.camip2 = config["camip2"]
    self.camip3 = config["camip3"]
    self.camip4 = config["camip4"]

end



# Under construction



end
