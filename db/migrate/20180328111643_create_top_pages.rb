class CreateTopPages < ActiveRecord::Migration[5.1]
  def change
    create_table :top_pages do |t|

      t.timestamps
    end
  end
end
