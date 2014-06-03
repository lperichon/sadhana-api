class AddUserToPractices < ActiveRecord::Migration
  def change
    add_reference :practices, :user, index: true
  end
end
