class OrderForm 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :build, :phone_number, :token


with_options presence: true do
  validates :user_id
  validates :item_id
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :municipality
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
  validates :token
end

validates :phone_number, length: { in: 10..11, message: "is too short" }


def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Payment.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality , address: address, build: build,phone_number: phone_number, order_id: order.id)
end
end

