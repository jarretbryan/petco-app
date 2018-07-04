class OwnersController < ApplicationController

  before_action :get_owner, only: [:show, :edit, :update, :destroy]

  def index
    @owners = Owner.all
  end

  def show
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to owner_path(@owner)
    else
      render :new
    end
  end

  def edit
    redirect_to owner_path(@owner)
  end

  def update
  end

  def destroy
    @owner.pets.each do |pet|
      pet.destroy
    end

    @owner.destroy
    redirect_to owners_path

  end

  private

  def get_owner
    @owner = Owner.find(params[:id])
  end
  #don't need to include model in hash because this is not forms_for, this is from URL

  def owner_params
    params.require(:owner).permit(:name)
  end

end
