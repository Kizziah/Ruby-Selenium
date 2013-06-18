class ArmiesController < ApplicationController

  def index
    @faction = ["choas", "blood"]
    @armies = Army.all
  end

  def show
    @army = Army.find(params[:id])
    @army.squads.each do |squad|
      squad.delete_if_not_valid
    end
  end

  def new_blood
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
      @army.squads.each do |s|
        s.define_base_squad
        s.delete_if_not_valid
      end
      redirect_to @army, notice: 'Army was successfully created.'
    else
      render :new
    end
  end

  def update
    @army = Army.find(params[:id])

    if @army.update_attributes(params[:army])
      @army.squads.each do|s|
        if  s.points.nil?
          s.define_base_squad
        end
      end
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
