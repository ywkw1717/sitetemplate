class AddPlayback < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :playback, :integer
  end
end
