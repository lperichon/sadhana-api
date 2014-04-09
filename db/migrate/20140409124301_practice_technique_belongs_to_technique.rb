class PracticeTechniqueBelongsToTechnique < ActiveRecord::Migration
  def change
  	add_column :practice_techniques, :technique_id, :integer
  	add_index :practice_techniques, :technique_id
  end
end
