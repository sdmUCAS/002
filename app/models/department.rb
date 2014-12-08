class Department < ActiveRecord::Base
	has_many:instruments
	has_many :users
end
