class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :symbol

      t.timestamps
    end
  end
end
