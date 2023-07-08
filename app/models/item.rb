class Item < ApplicationRecord
  belongs_to:user
  # has_one:order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :deadline

  validates :image          , presence: true
  validates :title          , presence: true
  validates :description    , presence: true
  validates :cost           , presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id    , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id      , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :postage_id     , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id  , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :deadline_id    , numericality: { other_than: 1 , message: "can't be blank"} 

end
