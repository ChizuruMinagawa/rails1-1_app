class AddColumnsToPosts < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :start_date, :datetime, using: "start_date::datetime"
    change_column :posts, :end_date, :datetime, using: "end_date::datetime"
  end

  def down
    change_column :posts, :start_date, :date, using: "start_date::date"
    change_column :posts, :end_date, :date, using: "end_date::date"
  end

end
