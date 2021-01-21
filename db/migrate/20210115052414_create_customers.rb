class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :last_name,        null: false
      t.string :first_name,       null: false
      t.string :last_name_kana,   null: false
      t.string :first_name_kana,  null: false
      t.string :postal_code,      null: false
      t.integer :prefecture_id,   null: false
      t.string :city,             null: false
      t.string :house_number,     null: false
      t.string :building_name
      t.string :phone
      t.string :product_name
      t.integer :amount_money,    null: false
      t.date   :visit_date,       null: false
      t.date   :purchase_date
      t.text   :remark_column
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
