class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :show, :create, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new(user_id: @user.id)
  end

  def create
    @profile = Profile.new(profile_params)

    @profile.user_id = @user.id
    if @profile.save
      render :show
    else
      render :new
    end
  end

  def show

    if @profile
      render :show
    else
      render root_path
    end
  end

  def edit
  end

  def update

    if @profile.update(profile_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @profile.delete

    redirect_to root_path
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def set_profile
    @profile = Profile.find_by(id: params[:id].to_i)
  end

  def set_user
    @user = User.find(params[:user_id].to_i)
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio)
  end
end
