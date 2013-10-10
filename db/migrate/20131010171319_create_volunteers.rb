class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :quantity_given
      t.belongs_to :volunteerable, polymorphic: true

      t.timestamps
    end
    add_index :volunteers, [:volunteerable_type, :volunteerable_id]
  end
end
