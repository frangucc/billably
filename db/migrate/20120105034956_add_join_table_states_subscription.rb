class AddJoinTableStatesSubscription < ActiveRecord::Migration
  def change
    create_table :states_subscriptions do |t|
      t.belongs_to :state,        :required => true
      t.belongs_to :subscription, :required => true
    end
    add_index :states_subscriptions, :state_id
    add_index :states_subscriptions, :subscription_id
  end

end
