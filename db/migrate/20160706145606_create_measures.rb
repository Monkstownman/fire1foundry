class CreateMeasures < ActiveRecord::Migration[5.0]
  def change
    create_table :measures do |t|
      t.text :title
      t.text :body
      t.datetime :datetime
      t.text :name
      t.text :value
      t.integer :user_id
      t.text :unit
      t.text :source
      t.text :comment
      t.boolean :active

      t.timestamps
    end
  end
end
