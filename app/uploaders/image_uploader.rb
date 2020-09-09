class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  version :thumb do 
    process resize_to_fit: [100, 100] 
  end 
 # process resize_to_limit: [500, 500]
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def picture_size
    if picture.size > 5.megabytes  
      errors.add(:picture, "should be less than 5MB")  
    end
  end
  
end