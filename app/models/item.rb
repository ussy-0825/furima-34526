class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :prefectures, :deliveryfee, :shipping
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :price, numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    message: 'は300円〜9,999,999円の間で設定してください' }

  with_options presence: true do
    validates :image, :name, :text, :category_id, :status_id, :prefectures_id, :delivery_fee_id, :shipping_id
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end

  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :category_id, :status_id, :prefectures_id, :delivery_fee_id, :shipping_id
  end
end
