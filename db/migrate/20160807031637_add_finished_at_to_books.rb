class AddFinishedAtToBooks < ActiveRecord::Migration
  def change
    add_column :books, :finished_at, :datetime , null: true
  end
end
