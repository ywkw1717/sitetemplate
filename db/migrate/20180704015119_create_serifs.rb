class CreateSerifs < ActiveRecord::Migration[5.1]
  def change
    create_table :serifs do |t|
      t.string :title
      t.string :filename
      t.string :source

      t.timestamps
    end
  end
end
