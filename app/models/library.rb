class Library < ApplicationRecord
	mount_uploader :file, FileUploader
end
