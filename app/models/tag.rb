class Tag < ApplicationRecord
	belongs_to :user
  has_many :items
	validates :tag, presence: true, length: {minimum: 2, maximum: 20}
end
