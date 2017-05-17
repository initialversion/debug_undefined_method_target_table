class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :project_id
      t.string :name
      t.string :description
      t.string :url

      t.timestamps

    end
  end
end
