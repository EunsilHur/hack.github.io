class AvatarUploader < CarrierWave::Uploader::Base

  storage :fog

  def store_dir
    "uploads/"
  end
  
end