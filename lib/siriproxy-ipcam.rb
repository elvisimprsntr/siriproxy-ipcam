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
  end

listen_for(/garage cam/i) {garage_cam}

listen_for(/porch cam/i) {porch_cam}

listen_for(/attic cam/i) {attic_cam}

listen_for(/living cam/i) {living_cam}

listen_for(/check cameras/i) {camera_check)  


  def garage_cam
  # turn on light
	Rest.get("#{self.isyip}/rest/nodes/27356/cmd/DON", :basic_auth => @isyauth)
	# push garage camera image to phone	
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new("Garage Camera", [SiriAnswerLine.new('logo',"#{self.camurl1")])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
	# turn off light
	Rest.get("#{self.isyip}/rest/nodes/27356/cmd/DOF", :basic_auth => @isyauth)
    request_completed
  end

  def porch_cam
	# turn on light
	Rest.get("#{self.isyip}/rest/nodes/32377/cmd/DON", :basic_auth => @isyauth)
	# push garage camera image to phone	
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new("Porch Camera", [SiriAnswerLine.new('logo',"#{self.camurl2")])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
	# turn off light
	Rest.get("#{self.isyip}/rest/nodes/27356/cmd/DOF", :basic_auth => @isyauth)
    request_completed
  end

  def attic_cam
	# turn on light
	Rest.get("#{self.isyip}/rest/nodes/18595/cmd/DON", :basic_auth => @isyauth)
	# push garage camera image to phone	
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new("Attic Camera", [SiriAnswerLine.new('logo',"#{self.camurl3")])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
	# turn off light
	Rest.get("#{self.isyip}/rest/nodes/27356/cmd/DOF", :basic_auth => @isyauth)
    request_completed
  end

  def living_cam
	# turn on light
	Rest.get("#{self.isyip}/rest/nodes/19496/cmd/DON", :basic_auth => @isyauth)
	# push garage camera image to phone	
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new("Living Camera", [SiriAnswerLine.new('logo',"#{self.camurl4")])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
	# turn off light
	Rest.get("#{self.isyip}/rest/nodes/27356/cmd/DOF", :basic_auth => @isyauth)
    request_completed
  end

  def camera_check
	garage_cam
	porch_cam
	attic_cam
	living_cam
  end
	
end
