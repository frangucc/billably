class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string    :attachment, :required => true
      t.integer   :package_id
      t.integer   :merchant_id
      t.timestamps
    end
  end
end
