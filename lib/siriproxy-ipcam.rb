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
	if @camUrl.has_key?(camera)
		if @camUrl[camera].has_key?("id")
			open(@camUrl[camera]["url"], :http_basic_authentication => [@camUrl[camera]["id"], @camUrl[camera]["pw"]]) do |f|
				File.open("/var/www/" + camera.gsub(/\s+/, "") + ".jpg", "wb") do |file|
					file.puts f.read
				end
			end
  			push_image(camera.capitalize, @webIp + "/" + camera.gsub(/\s+/, "") + ".jpg")
		else
			push_image(camera.capitalize, @camUrl[camera]["url"])
		end
	else
		say "Sorry, I could not find a camera named #{camera}."
		say "Here is the list of cameras."
		@camUrl.each_key {|camera| say camera.capitalize}
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