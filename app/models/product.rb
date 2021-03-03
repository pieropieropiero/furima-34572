class Product < ApplicationRecord

  validates :name, length: {maximum: 40}, presence: true
  validates :introduction, length: {maximum: 1000}, presence: true

  validates :category_id, :status_id, :sent_fee_id, :sent_area_id, :arrival_period_id, :price, :image, presence: true
  validates :category_id, :status_id, :sent_fee_id, :sent_area_id, :arrival_period_id, numericality: { other_than: 1 }
  
  validates :price, numericality: { only_integer: true }, inclusion: { in: 300..9999999 }

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :sent_fee
  belongs_to_active_hash :sent_area
  belongs_to_active_hash :arrival_period
  
  belongs_to :user
  has_one_attached :image


end
