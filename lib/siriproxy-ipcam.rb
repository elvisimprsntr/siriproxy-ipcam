require 'open-uri'
require 'siri_objects'

class SiriProxy::Plugin::IPCam < SiriProxy::Plugin
  attr_accessor :camurls
  attr_accessor :camid
  attr_accessor :campw
  attr_accessor :webip
  
  def initialize(config)
    @camAuth = nil
    @camAuth = {:http_basic_authentication => [config["camid"], config["campw"]]} if config["camid"] 
    @webIp = config["webip"] 
    @camUrl = Hash.new
    @camUrl = config["camurls"]
  end

  listen_for(/camera (.*)/i) do |camera|
	check_camera camera
  end

  def check_camera(camera)
	cameraurl = @camUrl[camera.downcase.strip]
	unless cameraurl.nil?
		unless @camAuth.nil?
			open(cameraurl, @camAuth) do |f|
				File.open("/var/www/image.jpg","wb") do |file|
					file.puts f.read
  				end
			end
			cameraurl = "#{@webIp}/image.jpg"
		end	
		object = SiriAddViews.new
		object.make_root(last_ref_id)
		answer = SiriAnswer.new(camera,[SiriAnswerLine.new('logo',cameraurl)])
		object.views << SiriAnswerSnippet.new([answer])
		send_object object
	else
		say "Sorry, I could not find a camera named #{camera}."
	end
     request_completed
  end
	
end