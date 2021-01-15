class Customer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensios
  belongs_to :user
  belongs_to :prefecture

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 0 ,message: "Select"}
    validates :city
    validates :house_number
    validates :visit_date
  end
end
