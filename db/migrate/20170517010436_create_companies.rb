class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.float :hours_available
      t.float :hours_used
      t.string :plan
      t.string :name

      t.timestamps

    end
  end
end
