class ChangeDataAmountMoneyCustomers < ActiveRecord::Migration[6.0]
  def change
    change_column :customers, :amount_money, :integer
  end
end
