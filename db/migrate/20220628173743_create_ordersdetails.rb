class CreateOrdersdetails < ActiveRecord::Migration[6.0]
  def change
    create_table :ordersdetails do |t|

      t.timestamps
    end
  end
end
