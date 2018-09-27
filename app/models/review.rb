class Review < ApplicationRecord
	
	# validates :name, presence: true

	after_initialize :set_default_kat, :if => :new_record?
	acts_as_list scope: :katbib
	belongs_to :katbib
	def set_default_kat
    self.katbib_id ||= 2
  end
end
