require 'siri_objects'
require 'cgi'

class SiriProxy::Plugin::IPCam < SiriProxy::Plugin
  attr_accessor :camurl1
  attr_accessor :camurl2
  attr_accessor :camurl3
  attr_accessor :camurl4
  attr_accessor :camid
  attr_accessor :campw

  def initialize(config)
    self.camurl1 = config["camurl1"]
    self.camurl2 = config["camurl2"]
    self.camurl3 = config["camurl3"]
    self.camurl4 = config["camurl4"]
    self.camid = config["camid"]
    self.campw = config["campw"]


end



# Under construction



end
