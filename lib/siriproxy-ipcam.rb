require 'siri_objects'
require 'cgi'

class SiriProxy::Plugin::IPCam < SiriProxy::Plugin
  attr_accessor :camid
  attr_accessor :campw
  attr_accessor :camurl1
  attr_accessor :camurl2
  attr_accessor :camurl3
  attr_accessor :camurl4
  
  def initialize(config)
    self.camid = config["camid"]
    self.campw = config["campw"]
    self.camurl1 = config["camurl1"]
    self.camurl2 = config["camurl2"]
    self.camurl3 = config["camurl3"]
    self.camurl4 = config["camurl4"]
    @camauth = {:username => "#{self.camid}", :password => "#{self.campw}"}

@camUrl = Hash.new
@camUrl["garage"] = "#{self.camurl1}"
@camUrl["porch"] = "#{self.camurl2}"
@camUrl["attic"] = "#{self.camurl3}"
@camUrl["addict"] = "#{self.camurl3}"
@camUrl["living room"] = "#{self.camurl4}"

  end

  listen_for(/camera (.*)/i) do |camera|
	check_camera camera
  end
  
  def check_camera(camera)
	cameraurl = @camUrl[camera.downcase.strip]
	unless cameraurl.nil?
		object = SiriAddViews.new
		object.make_root(last_ref_id)
		answer = SiriAnswer.new("#{camera}",[SiriAnswerLine.new('logo',"#{cameraurl}")])
		object.views << SiriAnswerSnippet.new([answer])
		send_object object
	else
		say "Sorry, I could not find a camera named #{camera}."
	end
     request_completed
  end
	
end
