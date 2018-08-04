class Resizeimage < ApplicationRecord
	mount_uploader :file, ResizerUploader
	
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_resizer

  def crop_resizer
    file.recreate_versions! if crop_x.present?
  end
end
