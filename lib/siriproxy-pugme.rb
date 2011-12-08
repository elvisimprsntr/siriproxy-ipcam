require 'httparty'

class SiriProxy::Plugin::Pugme < SiriProxy::Plugin
  def initialize(config = {})
  end

  listen_for /pug me/i do
		pugUrl = HTTParty.get("http://pugme.herokuapp.com/random").parsed_response['pug']

    say "Here is your pug:"

    # send a "Preview" of the Tweet
    object = SiriAddViews.new
    object.make_root(last_ref_id)
    answer = SiriAnswer.new("Pugme", [
      SiriAnswerLine.new('logo',pugUrl)
    ])
    object.views << SiriAnswerSnippet.new([answer])
    send_object object
  end
end
