require 'siri_objects'

class SiriProxy::Plugin::picturejokes < SiriProxy::Plugin
  attr_accessor :webip

  def initialize(config)
    self.webip = config["webip"]

end



listen_for(/open the pod bay doors/i) {open_pod_door}

listen_for(/have a lambo/i) {toy_lambo}

listen_for(/where is my lambo/i) {find_lambo}

listen_for(/hummer|blowjob|blow job/i) {hummer}

listen_for(/hooker|prostitute|porn star/i) {hooker}




  def open_pod_door
    say "I'm sorry. I'm afraid I can't do that."
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new("HAL 9000", [SiriAnswerLine.new('logo',"#{self.webip}/hal.jpg")])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
    request_completed 
  end

  def toy_lambo
    say "Yes you have a Lamborghini.  It is not a very practical form of transportation.  It does not have much leg room or room for luggage."
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new("Your Lamborghini", [SiriAnswerLine.new('logo',"#{self.webip}/lambo-toy.jpg")])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
    request_completed 
  end

  def find_lambo
    say "OK. Searching for your Lamborghini."
    say "I found your Lamborghini.  It is safely parked in your garage.  Would you like me to warm it up for you?"
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new("Lamborghini Location", [SiriAnswerLine.new('logo',"#{self.webip}/lambo-garage.jpg")])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
    request_completed 
  end

  def hummer
    say "I am not that kind of assistant, but former President Bill Clinton has a suggestion for you."
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new("Monica Lewinsky", [SiriAnswerLine.new('logo',"#{self.webip}/Monica-Lewinsky.jpeg")])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
		response = ask "Would you like me to give her a call?"
		if (response =~ /yes|yep|yeah|ok/i)
    			say "OK. Her number went straight to voice mail.  She must be very popular.  While you wait for her to call back, I found sixteen cigar shops fairly close to you."
		else
			say "Your probably better off.  You would have had a long wait to get an appointment."
		end
    request_completed 
  end

  def hooker
    say "I am not that kind of assistant, but Charlie Sheen recommends Capri Anderson.  She is available one hour from now."
	object = SiriAddViews.new
	object.make_root(last_ref_id)
	answer = SiriAnswer.new("Capri Anderson", [SiriAnswerLine.new('logo',"#{self.webip}/capri-anderson.jpg")])
	object.views << SiriAnswerSnippet.new([answer])
	send_object object
		response = ask "Would you like me to schedule an appointment and add it to your calendar?"
		if (response =~ /yes|yep|yeah|ok/i)
    			say "OK. Adding appointment to your calendar.  I took the liberty of adding a reminder to pick up some cocaine and condoms on the way."
		else
			say "That is too bad. I sensed she was excited to see you again. She sends her love."
		end
    request_completed 
  end




end
