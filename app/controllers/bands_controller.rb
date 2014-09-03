class BandsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @band = Band.new
  end

  def create
    @band = Band.new(params[:band])

    @band.user_id = current_user.id

    if @band.save
      redirect_to users_path, notice: "Band Started!"
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
    @q = Band.search(params[:q])
    @bands = @q.result(distinct: true)
  end

  def manage_band
    @band = User.find(params[:id]).band
  end

end