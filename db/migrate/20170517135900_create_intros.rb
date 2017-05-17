class CreateIntros < ActiveRecord::Migration[5.0]
  def change
    create_table :intros do |t|
      t.string :title
      t.string :content
      t.string :image
      t.string :link
      t.boolean :is_hidden, default: false

      t.timestamps
    end
  end
end
