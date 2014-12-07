class User < ActiveRecord::Base
  belongs_to :department
  
  has_many :orders, dependent: :destroy
end
