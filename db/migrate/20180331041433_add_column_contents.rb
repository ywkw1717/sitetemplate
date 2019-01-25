class AddColumnContents < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :view, :integer, :after => :url
    add_column :contents, :good, :integer, :after => :view
    add_column :contents, :comment, :integer, :after => :good
    add_column :contents, :post_time, :date, :after => :comment
  end
end
