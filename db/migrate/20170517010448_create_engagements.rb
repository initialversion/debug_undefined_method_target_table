class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.integer :project_id
      t.integer :client_id

      t.timestamps

    end
  end
end
