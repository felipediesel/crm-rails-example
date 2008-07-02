class Document < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :title
  validates_presence_of :project_id
  has_attachment :storage => :file_system, :max_size => 500.kilobytes,
  :path_prefix => 'public/uploads/documents'
  validates_as_attachment
end
