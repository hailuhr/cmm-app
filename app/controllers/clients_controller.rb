class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  # before_action :set_user, only: [:new, :show, :create, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new()
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      render :show
    else
      render :new
    end
  end

  def show

    if @client
      render :show
    else
      render root_path
    end
  end

  def edit
  end

  def update

    if @client.update(client_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @client.delete

    redirect_to root_path
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def set_client
    @client = Client.find_by(id: params[:id].to_i)
  end

  def set_user
    @user = User.find_by(id: params[:user_id].to_i)
  end

  def client_params
    params.require(:client).permit(:name)
  end
end
