class AddPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :decimal, {:precision => 8, :scale => 2}
    
    LineItem.all.each do |li|
      li.price = li.product.price
    end
  end
end
