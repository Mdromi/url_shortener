class AddIpAddressToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :ip_address, :string
  end
end
