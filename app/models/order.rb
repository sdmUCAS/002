class Order < ActiveRecord::Base
  belongs_to :user

  has_many :orders_states, dependent: :destroy
  has_many :orders_instruments, dependent: :destroy
end
