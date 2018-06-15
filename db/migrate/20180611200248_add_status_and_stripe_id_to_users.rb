class AddStatusAndStripeIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :paid, :boolean
    add_column :users, :stripeid, :string
  end
end
