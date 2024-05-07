class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :user_id
    validates :image
    validates :item_name
    validates :item_explain
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
