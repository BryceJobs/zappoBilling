class Client < ActiveRecord::Base
  attr_accessible :Fname, :Ln

  scope :shopify, lambda {|sid| where("shop_id = ?", sid)}
  validates :Fname, presence: true
  validates :Lname, presence: true
  validates :phonenumber, presence: true,
  						  numericality: true

  has_many :orders
end
