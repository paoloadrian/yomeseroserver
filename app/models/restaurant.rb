class Restaurant < ActiveRecord::Base
  has_many :items
  has_many :tables
end
