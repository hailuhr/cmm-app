class WelcomeController < ApplicationController

  def index
    @message = "CMD App Jan 27"
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def welcome_params
    binding.pry
    params.require(:prescription).permit(:pharmacy_id)
  end
end
