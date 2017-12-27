class Tag < ApplicationRecord
	has_many :items
	validates :tag, presence: true, length: {minimum: 2, maximum: 20}
end
