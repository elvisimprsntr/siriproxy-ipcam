require 'socket'
require 'open-uri'
require 'siri_objects'

class SiriProxy::Plugin::IPCam < SiriProxy::Plugin
  attr_accessor :camurls
  attr_accessor :camid
  attr_accessor :campw
  
  def initialize(config = {})
    @camUrl = Hash.new
    @camUrl = config["camurls"]
    @camAuth = nil
    @camAuth = {:http_basic_authentication => [config["camid"], config["campw"]]} if config["camid"] 
    @webIp = "http://" + UDPSocket.open {|s| s.connect("255.255.255.0", 1); s.addr.last}
  end
  
########## Commands   

  listen_for(/camera (.*)/i) do |camera|
	check_camera camera.downcase.strip
	request_completed
  end
  
  listen_for(/check cameras/i) do 
	@camUrl.each_key {|camera| check_camera(camera)} 
	request_completed
  end

########## Actions   
 
  def check_camera(camera)
	cameraurl = @camUrl[camera]
	unless cameraurl.nil?
		unless @camAuth.nil?
			open(cameraurl, @camAuth) do |f|
				File.open("/var/www/" + camera.gsub(/\s+/, "") + ".jpg","wb") do |file|
					file.puts f.read
  				end
			end
			cameraurl = @webIp + "/" + camera.gsub(/\s+/, "") + ".jpg"
		end
		push_image(camera, cameraurl)	
	else
		say "Sorry, I could not find a camera named #{camera}."
		say "Here is the list of cameras."
		@camUrl.each_key {|camera| say camera}
		camera = ask "Which camera would you like to view?"  
		check_camera(camera.downcase.strip)
	end
  end
  
  def push_image(title, image)
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new(title, [SiriAnswerLine.new('logo', image)])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
  end		

	
end