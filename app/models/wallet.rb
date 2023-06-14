class Wallet < ApplicationRecord
  belongs_to :user
  has_many :extracts, dependent: :destroy
end
