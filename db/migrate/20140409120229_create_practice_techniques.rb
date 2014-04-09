class CreatePracticeTechniques < ActiveRecord::Migration
  def change
    create_table :practice_techniques do |t|
      t.references :practice_part, index: true
      t.integer :position

      t.timestamps
    end
  end
end
