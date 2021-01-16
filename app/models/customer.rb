class Customer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :prefecture

  with_options presence: true do
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "を全角ひらがな、全角カタカナ、漢字で入力してください"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "を全角ひらがな、全角カタカナ、漢字で入力してください"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/,message: "を全角カタカナで入力してください"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/,message:"を全角カタカナで入力してください"}
    validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/,message: "をハイフン(-)含む7桁の半角数字を入力してください"}
    validates :prefecture_id, numericality: { other_than: 0 ,message: "を選択してください"}
    validates :city
    validates :house_number
    validates :visit_date
  end

  validates :amount_money, format: {with:/\A[0-9]+\z/,message: "を半角数字で入力してください"}, allow_blank: true
   validates :remark_column,length: { minimum: 0, maximum: 150 }
end
