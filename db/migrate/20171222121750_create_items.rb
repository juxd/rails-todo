class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :task
      t.datetime :due

      t.timestamps
    end
  end
end
