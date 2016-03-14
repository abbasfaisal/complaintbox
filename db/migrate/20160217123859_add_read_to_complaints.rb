class AddReadToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :read, :boolean
  end
end
