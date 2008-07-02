class ChangeCustomersPhoneField < ActiveRecord::Migration

  def self.up
    remove_column :customers, :phone
    add_column :customers, :phone_country_code, :integer
    add_column :customers, :phone_area_code, :integer
    add_column :customers, :phone_number, :string
  end

  def self.down
    remove_column :customers, :phone_number
    remove_column :customers, :phone_area_code
    remove_column :customers, :phone_country_code
    add_column :customers, :phone, :string
  end
  
end
