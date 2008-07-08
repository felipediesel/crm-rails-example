xml.instruct!
xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title   "Tasks"
    xml.link    task_url(@task)
    xml.pubDate @tasks.first.created_at.rfc822 if @tasks.any?

    @tasks.each do |task|
      xml.item do
        xml.title       "Task #{task.id.to_s } for project #{task.project.name}"
        xml.description task.description
        xml.link        task_path(task)
        xml.pubDate     task.created_at.rfc822
        xml.guid        task_path(task)
      end
    end
  end
end
