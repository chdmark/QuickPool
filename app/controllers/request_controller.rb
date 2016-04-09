class RequestController < ApplicationController

  def index
    @requests = Request.all
  end

  def new

  end

  def show
    @request = Request.find(params[:id])
  end

  def create
    @request = Request.new
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
      :match?,
      :driver?,
      :origin_loc,
      :destination_loc
      :user_id
      )
  end

end
