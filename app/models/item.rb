class Item < ApplicationRecord
  belongs_to:user
  # has_one:order
  has_one_attached :image

  # validates :title          , presence: true
  # validates :description    , presence: true
  # validates :category_id    , presence: true
  # validates :status_id      , presence: true
  # validates :postage_id     , presence: true
  # validates :prefecture_id  , presence: true
  # validates :deadline_id    , presence: true
  # validates :cost           , presence: true
end
