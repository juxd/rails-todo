class AddTagToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :tag, foreign_key: true
  end
end
