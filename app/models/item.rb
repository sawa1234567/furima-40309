class Item < ApplicationRecord


  with_options presence: true do
    validates :user_id
    validates :image
    validates :item_name
    validates :item_explain
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :date
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end