class AddCountViewToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :count_view, :integer, default: 0
  end
end
