class ReportsController < ApplicationController
  def list_immediate_action_required
    @tasks = Task.find_high(:order => "title") 
  end

end
