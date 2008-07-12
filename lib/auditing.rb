module CRM 
  module Auditing 
    def self.append_features(base) 
      base.after_create do |object| 
        CRM::Auditing::create_audit_entry("insert", object) 
      end 
      base.after_update do |object| 
        CRM::Auditing::create_audit_entry("update", object) 
      end 
      base.after_destroy do |object| 
        CRM::Auditing::create_audit_entry("delete", object) 
      end 
    end 
    
    def self.create_audit_entry(operation, object) 
      unless object.kind_of?(AuditEntry)
        AuditEntry.create(:operation => operation, 
          :changes => object.to_xml, 
          :model_name => object.class.name, 
          :user_id => User.current_user_id, 
          :created_at => DateTime.now) 
      end
    end 
  end 
end 

ActiveRecord::Base.class_eval do 
  include CRM::Auditing 
end 