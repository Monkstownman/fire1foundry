class CreateLookups < ActiveRecord::Migration[5.0]
  def change
    create_table :lookups do |t|
      t.integer :group_id
      t.integer :entity_id

      t.timestamps
    end
  end
end
