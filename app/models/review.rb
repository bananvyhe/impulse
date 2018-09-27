class Review < ApplicationRecord
	acts_as_list scope: :katbibs
	belongs_to :katbibs
	validates :name, presence: true
end
