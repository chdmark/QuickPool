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
        redirect_to trip_path(Trip.last)
      else
        redirect_to request_path(@request.id)
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
