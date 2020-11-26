class DosesController < ApplicationController

  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params["cocktail_id"])
  end

  def create
    @cocktail = Cocktail.find(params["cocktail_id"])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
