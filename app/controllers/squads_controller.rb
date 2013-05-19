class SquadsController < ApplicationController

  before_filter :fetch_army
  def index
    @squads = Squad.all
  end

  def show
    @squad = Squad.find(params[:id])
  end

  def new
    @squad = Squad.new
    troop = @squad.troops.build
  end

  def edit
    @squad = Squad.find(params[:id])
  end

  def create
    @squad = Squad.new(params[:squad])
    if @squad.save
      redirect_to @squad, notice: 'Squad was successfully created.'
    else
      render :new
    end
  end

  def update
    @squad = Squad.find(params[:id])

    if @squad.update_attributes(params[:squad])
      redirect_to @army, notice: 'Squad was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @squad = Squad.find(params[:id])
    @squad.destroy
  end

  private

  def fetch_army
    @army = Army.find(params[:army_id])
  end

end
