class HomeController < ApplicationController

  def index
    @incomplete_tasks = current_user.tasks.with_status :open 
    @completed_tasks = current_user.tasks.with_status :closed 
  end
  
  def finish
    @task = current_user.tasks.find(params[:id]) 
    @task.update_attribute("status", "closed") 
  end 

end
