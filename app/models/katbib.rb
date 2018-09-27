class Katbib < ApplicationRecord
	acts_as_list
	has_many :reviews, ->{ order(position: :asc)}, dependent: :destroy
	scope :sorted, ->{order(position: :asc)}
	validates :name, presence: true
end
