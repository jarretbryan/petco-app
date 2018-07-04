class PetsController < ApplicationController

  before_action :get_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
    if params[:search]
      @pets = Pet.search(params[:search])
    end
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pet.update(update_pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def get_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :owner_id)
  end

  def update_pet_params
    params.require(:pet).permit(:name, :owner_id)
  end

end
