class User < ApplicationRecord
  has_many :measures
  has_many :lookups
end
