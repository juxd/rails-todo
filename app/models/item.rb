class Item < ApplicationRecord
	belongs_to :tag
	validates :due, presence: true
end
