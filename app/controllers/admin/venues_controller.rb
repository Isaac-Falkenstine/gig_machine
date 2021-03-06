class Admin::VenuesController < Admin::BaseController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :edit
    end
  end

  def create
    Venue.create(venue_params)
    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :email)
  end
end
