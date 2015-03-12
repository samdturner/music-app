class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def edit
    @band = Band.find(params[:id])
  end

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find_by(id: params[:id])
    unless @band
      flash[:errors] = "Band with id #{params[:id]} does not exit"
      redirect_to bands_url
    end
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:success] = "You have successfully created a new band!"
      redirect_to bands_url(@band)
    else
      flash[:error] = @band.errors.full_messages
      redirect_to new_bands_url
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy
    redirect_to bands_url
  end


  private
    def band_params
      params.require(:band).permit(:name)
    end
end
