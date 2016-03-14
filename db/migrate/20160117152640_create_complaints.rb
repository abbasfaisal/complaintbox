class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :description
      t.datetime :created_at
      t.string :areaname

      t.timestamps null: false
    end
  end
end
