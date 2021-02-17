class Orderdelivery
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefectures_id, :city, :address, :building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "code Input correctly"}
    validates :phone, format: {with: /\A[0-9]{11}\z/, message: "number Input only number"}
    validates :city, :address, :user_id, :item_id
  end
  validates :prefectures_id, numericality: { other_than: 0, message: 'Select' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end

end