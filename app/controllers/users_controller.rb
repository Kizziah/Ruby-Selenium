class UsersController < ApplicationController

  def dashboard
    @user = current_user
    @profile = @user.profile
    @armies = Army.all
  end

end
