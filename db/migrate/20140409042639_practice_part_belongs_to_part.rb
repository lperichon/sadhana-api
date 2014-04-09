class PracticePartBelongsToPart < ActiveRecord::Migration
  def change
  	add_column :practice_parts, :part_id, :integer
  	add_index :practice_parts, :part_id
  end
end
