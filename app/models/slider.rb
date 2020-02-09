class Slider < ApplicationRecord
	acts_as_list
	mount_uploader :slide, SlideUploader
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :slidetube
  after_update :crop_slide
	scope :sorted, ->{ order(position: :asc) }
  def crop_slide
    slide.recreate_versions! if crop_x.present?
  end
end
