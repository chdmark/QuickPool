class RequestController < ApplicationController

  include Geokit::Geocoders

  def index
    @requests = Request.all
  end

  def new
    render "request/_new", layout: false
  end

  def show
    @request = Request.find(params[:id])
  end

  def create
    @request = current_user.requests.new(request_params)

    if @request.save
      if @request.check_for_matches
        redirect_to user_path(current_user.id)
      else
        redirect_to user_path(current_user.id)
      end
    else
      flash[:error] = "Failed to create"
      redirect_to user_path(current_user.id)
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update(request_params)
    if @request.save
      redirect_to request_path(@request.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to user_path(current_user.id)
  end

  def inactive
    @request = Request.find(params[:id])
    @request.active = false
    @request.save
    redirect_to user_path(current_user.id)
  end

  #METHODS
  def send_text_message(number_to_send_to)
    # number_to_send_to = params[:number_to_send_to]
    p "*" * 80
    p "Sending Message"
    twilio_sid = "ACe2ac50d1fadcd66bdce01990ae9bb474"
    twilio_token = "851c6c93112537f05fbaaa5915ab8242"
    twilio_phone_number = "7075631899"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "You got a match! View your profile for details! -QuickPool"
    )
  end

  private

  def request_params
    params.require(:request).permit(
      :match,
      :origin_loc,
      :driver,
      :destination_loc
      )
  end

end
