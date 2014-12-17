class Order < ActiveRecord::Base
  attr_accessible :amount, :client_id, :num_item

  scope :shopify, lambda {|sid| where("shop_id = ?", sid)}
  validates :amount, presence: true
  validates :client_id, presence: true
  validates :num_item, presence: true,
  					   numericality: true

  belongs_to :client
  has_many :order_lines
  has_many :products, through: :order_lines


  
end
