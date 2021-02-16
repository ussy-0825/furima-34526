class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :prefectures, :deliveryfee, :shipping
  has_one_attached :image

  validates :price, numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    message: 'Out of setting range' }

  with_options presence: true do
    validates :image, :name, :text, :category_id, :status_id, :prefectures_id, :delivery_fee_id, :shipping_id, :user_id
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end

  validates :category_id,     numericality: { other_than: 0, message: 'Select' }
  validates :status_id,       numericality: { other_than: 0, message: 'Select' }
  validates :prefectures_id,  numericality: { other_than: 0, message: 'Select' }
  validates :delivery_fee_id, numericality: { other_than: 0, message: 'Select' }
  validates :shipping_id,     numericality: { other_than: 0, message: 'Select' }
end
