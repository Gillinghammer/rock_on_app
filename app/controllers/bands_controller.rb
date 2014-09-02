class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(params[:band])

    if @band.save
      redirect_to bands_path, notice: "Album Created."
    else
      render "new"
    end

  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])

       respond_to do |format|
         if @band.update_attributes(params[:band])
           format.html { redirect_to @band, notice: 'Band was successfully updated.' }
           format.json { head :no_content }
         else
           format.html { render action: "edit" }
           format.json { render json: @band.errors, status: :unprocessable_entity }
         end
       end
  end

  def index
    @bands = Band.all
  end

  def manage_band
    @band = User.find(params[:id]).band
  end

end