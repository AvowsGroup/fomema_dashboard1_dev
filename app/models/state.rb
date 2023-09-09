class State < ApplicationRecord
  has_many :doctors, foreign_key: 'state_id'
  has_many :transactions, through: :doctors
end
