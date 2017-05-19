class ChangeBirthdayToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :birthday, :date
  end
end
