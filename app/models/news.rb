class News < ApplicationRecord
	mount_uploader :newspic, NewspicUploader
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_newspic

  def crop_newspic
    newspic.recreate_versions! if crop_x.present?
  end
end
