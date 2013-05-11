class ArmiesController < ApplicationController

  def index
    @armies = Army.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @armies }
    end
  end

  def show
    @total = 0
    @army = Army.find(params[:id])
    @squads = @army.squads

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @army }
    end
  end

  def new
    @total_points = 1
    @army = Army.new
   3.times { @army.squads.build(params[:squad]) }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @army }
    end
  end

  def edit
    @army = Army.find(params[:id])
  end

  def create
    @army = Army.new(params[:army])

    respond_to do |format|
      if @army.save
        format.html { redirect_to @army, notice: 'Army was successfully created.' }
        format.json { render json: @army, status: :created, location: @army }
      else
        format.html { render action: "new" }
        format.json { render json: @army.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @army = Army.find(params[:id])

    respond_to do |format|
      if @army.update_attributes(params[:army])
        format.html { redirect_to @army, notice: 'Army was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @army.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @army = Army.find(params[:id])
    @army.destroy

    respond_to do |format|
      format.html { redirect_to armies_url }
      format.json { head :no_content }
    end
  end

end
