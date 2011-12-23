class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :required => true, :null => false
      t.timestamps
    end
  end
end
