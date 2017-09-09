class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :file
  process convert: 'jpg'

  # 保存するディレクトリ名
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %W[jpg jpeg]
  end

  def filename
    "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  end

end
