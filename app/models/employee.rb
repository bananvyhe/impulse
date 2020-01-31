class Employee < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
 
	scope :sorted, ->{ order(position: :asc) }
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
end
