class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :areaname, primary_key: true

      t.timestamps null: false

    end
  end
end
