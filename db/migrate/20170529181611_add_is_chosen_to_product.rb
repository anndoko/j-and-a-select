class AddIsChosenToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_chosen, :boolean, default: false
  end
end
