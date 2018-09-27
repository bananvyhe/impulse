class Library < ApplicationRecord
	
	mount_uploader :file, FileUploader
	mount_uploader :cover, CoverUploader
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_cover
acts_as_list scope: :katbib2
	belongs_to :katbib2
  def crop_cover
    cover.recreate_versions! if crop_x.present?
  end
end
