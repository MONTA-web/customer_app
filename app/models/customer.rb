class Customer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensios
  belongs_to :user
  belongs_to :prefecture
end
