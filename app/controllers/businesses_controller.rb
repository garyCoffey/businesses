class BusinessesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new

  end

  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to "/businesses/#{@business.id}"
    else
      redirect_to '/'
      flash[:error] = 'It did not work'
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      flash[:success] = 'Updated successfully'
    redirect_to "/businesses/#{@business.id}"
  else
    flash[:error] = "messed up, friend"
    redirect_to "/businesses/#{@business.id}"
  end
end

def destroy
  @business = Business.find(params[:id])
  @business.destroy
  redirect_to '/'
end

  private

  def business_params
    params.permit(:name, :address, :description)
  end
end