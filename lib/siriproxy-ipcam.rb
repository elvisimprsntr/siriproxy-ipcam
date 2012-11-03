require 'open-uri'
require 'siri_objects'

class SiriProxy::Plugin::IPCam < SiriProxy::Plugin
  attr_accessor :camid
  attr_accessor :campw
  attr_accessor :camurl1
  attr_accessor :camurl2
  attr_accessor :camurl3
  attr_accessor :camurl4
  attr_accessor :webip
  
  def initialize(config)
    @camAuth = Hash.new
    @camAuth["porch"] = {:http_basic_authentication => [config["camid"], config["campw"]]}
    @camUrl = Hash.new
    @camUrl["garage"] = config["camurl1"]
    @camUrl["porch"] = config["camurl2"]
    @camUrl["attic"] = config["camurl3"]
    @camUrl["addict"] = config["camurl3"]
    @camUrl["living room"] = config["camurl4"]
    @webIp = config["webip"] 
  end


  listen_for(/camera (.*)/i) do |camera|
	check_camera camera
  end


  def check_camera(camera)
	cameraurl = @camUrl[camera.downcase.strip]
	camauth = @camAuth[camera.downcase.strip]
	unless cameraurl.nil?
		unless camauth.nil?
			open(cameraurl, camauth) do |f|
				File.open("/var/www/image.jpg","wb") do |file|
					file.puts f.read
  				end
			end
			cameraurl = "#{@webIp}/image.jpg"
		end	
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
