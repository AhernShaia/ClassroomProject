class AddUserIdToResume < ActiveRecord::Migration[6.1]
  def change
    add_column :resume, :user_id, :integer, index: true
  end
end
