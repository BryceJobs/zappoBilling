class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :qty

  scope :shopify, lambda {|sid| where("shop_id = ?", sid)}
  validates :name, presence: true
  validates :price, presence: true,
  					numericality: true
  validates :qty, presence: true,
  				  numericality: true


  has_many :order_lines
  has_many :orders, through: :order_lines

end
