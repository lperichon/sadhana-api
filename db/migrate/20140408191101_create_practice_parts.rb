class CreatePracticeParts < ActiveRecord::Migration
  def change
    create_table :practice_parts do |t|
      t.references :practice
      t.integer :position
      
      t.timestamps
    end
  end
end
