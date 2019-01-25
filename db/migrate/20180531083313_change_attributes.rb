class ChangeAttributes < ActiveRecord::Migration[5.1]
  def change
    change_column :contents, :post_time, :string
    change_column :contents, :playback, :string
  end
end
