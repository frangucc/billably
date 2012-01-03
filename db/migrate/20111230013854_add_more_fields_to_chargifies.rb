class AddMoreFieldsToChargifies < ActiveRecord::Migration
  def change
    add_column :chargifies, :archived_at,             :datetime
    add_column :chargifies, :expiration_interval,     :integer
    add_column :chargifies, :expiration_interval_unit, :string
    add_column :chargifies, :initial_charge_in_cents, :integer
    add_column :chargifies, :interval,                :integer
    add_column :chargifies, :interval_unit,           :string
    add_column :chargifies, :price_in_cents,          :integer
    add_column :chargifies, :request_credit_card,     :boolean
    add_column :chargifies, :require_credit_card,     :boolean
    add_column :chargifies, :return_params,           :string
    add_column :chargifies, :return_url,              :string
    add_column :chargifies, :trial_interval,          :integer
    add_column :chargifies, :trial_price_in_cents,    :integer
    add_column :chargifies, :trial_interval_unit,     :string
    add_column :chargifies, :update_return_url,       :string
  end
end
