class WelcomeController < ApplicationController

  def index
    @clients = Client.all
    @task_time = TaskTime.new
  end

  private

  # def grouped_options
  #   grouped_options = [
  #   ['Group 1',
  #     ["Item 1", "Item 2", "Item 3"]],
  #   ['Group 2',
  #     ["Item 1", "Item 2", "Item 3", "Item 4"]]
  # ]
  #
  # array = []
  #
  # Client.all.each do |client|
  #   ["Client #{client.name}",
  #
  #   ]
  # end


  # grouped_options_for_select(grouped_options)

end
