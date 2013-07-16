class ArmiesController < ApplicationController

  def index
    @armies = Army.all
  end

  def show
    @army = Army.find(params[:id])
  end

  def new_blood
    @army = Army.new
    @squad = @army.squads.build
    @squad.troops.build
  end

  def new_ultra
    @army = Army.new
    @squad = @army.squads.build
    @squad.troops.build
  end

  def new_dark
    @army = Army.new
    @squad = @army.squads.build
    @squad.troops.build
  end

  def new_wolf
    @army = Army.new
    @squad = @army.squads.build
    @squad.troops.build
  end

  def new_ork
    @army = Army.new
    @squad = @army.squads.build
    @squad.troops.build
  end


  def new
    @army = Army.new
    @squad = @army.squads.build
    @squad.troops.build
  end

  def edit
    @army = Army.find(params[:id])
    @name_number = 1
    squad = @army.squads.build
    squad.troops.build
  end

  def create
    @army = Army.new(params[:army])

    if @army.save
      redirect_to @army, notice: 'Army was successfully created.'
    else
      render :new
    end
  end

  def update
    @army = Army.find(params[:id])

    if @army.update_attributes(params[:army])

      redirect_to @army, notice: 'Army was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @army = Army.find(params[:id])
    @army.destroy
    redirect_to root_path
  end

end
