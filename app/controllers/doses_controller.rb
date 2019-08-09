class DosesController < ApplicationController
  before_action :set_cocktail

  def index
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :ingredient)
  end
end
