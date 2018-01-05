class AddNameAndPostalCodeAndStreetAddressAndTelephoneToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :postal_code, :integer
    add_column :users, :street_address, :text
    add_column :users, :telephone, :integer 
  end
end
