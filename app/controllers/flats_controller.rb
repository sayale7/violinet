class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end
  
  def show
    @flat = Flat.find(params[:id])
  end
  
  def new
    @flat = Flat.new
  end
  
  def create
    @flat = Flat.new(params[:flat])
    if @flat.save
      flash[:notice] = "Successfully created flat."
      redirect_to @flat
    else
      render :action => 'new'
    end
  end
  
  def edit
    @flat = Flat.find(params[:id])
  end
  
  def update
    @flat = Flat.find(params[:id])
    if @flat.update_attributes(params[:flat])
      flash[:notice] = "Successfully updated flat."
      redirect_to @flat
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    flash[:notice] = "Successfully destroyed flat."
    redirect_to flats_url
  end
end
