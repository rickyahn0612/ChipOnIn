class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity_have
      t.integer :quantity_needed
      t.belongs_to :itemable, polymorphic: true

      t.timestamps
    end
    add_index :items, [:itemable_type, :itemable_id]
  end
end
