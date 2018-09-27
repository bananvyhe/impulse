class Katbib2 < ApplicationRecord
	acts_as_list
	has_many :libraries, ->{ order(position: :asc)}, dependent: :destroy
	scope :sorted, ->{order(position: :asc)}
	validates :name, presence: true
end
