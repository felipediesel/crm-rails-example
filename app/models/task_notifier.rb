class TaskNotifier < ActionMailer::Base
  
  def update_notification(user, task) 
    recipients %('#{user.name}' <#{user.email}>) 
    from "crm@example.org" 
    subject "Task Update Notification" 
    body :user => user, :task => task    
  end   
end
