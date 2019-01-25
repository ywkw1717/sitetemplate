class AddPostnumSerif < ActiveRecord::Migration[5.1]
  def change
    add_column :serifs, :postnum, :integer, :after => :filename
  end
end
