class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id
  
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :address, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid."}
    validates :item_id
    validates :user_id
    
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, phone_number: phone_number, building: building, order_id: order.id)
  end
end