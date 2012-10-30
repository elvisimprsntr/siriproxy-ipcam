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
    @camauth = {:username => config["camid"], :password => config["campw"]}
    @camUrl = Hash.new
    @camUrl["garage"] = config["camurl1"]
    @camUrl["porch"] = config["camurl2"]
    @camUrl["attic"] = config["camurl3"]
    @camUrl["addict"] = config["camurl3"]
    @camUrl["living room"] = config["camurl4"]
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
