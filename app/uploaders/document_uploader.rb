# encoding: utf-8

class DocumentUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  #storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(pdf)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    #@name ||= "#{timestamp}-#{super}" if original_filename.present? and super.present?
    #"#{model.instruction.product.name}_#{model.instruction.language.name}_#{model.version}.pdf"
    #require 'securerandom'
    #SecureRandom.hex
    "document.pdf"
  end

  protected
    
    def timestamp
      var = :"@#{mounted_as}_timestamp"
      model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
    end
end
