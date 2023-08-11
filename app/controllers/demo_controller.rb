class DemoController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:receive]
  def index
    client = Vonage::Client.new(
      api_key: ENV["VONAGE_API_KEY"],
      api_secret: ENV["VONAGE_SECRET_KEY"]
    )
    p client
    a=client.sms.send(
      from: "Vonage APIs",
      to: ENV["PHONE_NUMBER"],
      text: 'A text message sent using the Vonage SMS API'
    )
    p a
  end
  def escape_output
  end
  def strip_links
  end

  def receive
    p "Here we are receiving webhooks"
    message_id = params[:messageId]
    p message_id
  end
end
