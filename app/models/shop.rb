class Shop < ActiveRecord::Base
  attr_accessible :address, :description, :name, :username,  :password, :password_confirmation

  has_secure_password

  
   
  validates :name, presence: true
  validates :description, presence: true
  validates :username, presence: true

  validates_presence_of :password, :on => :create
  

end
