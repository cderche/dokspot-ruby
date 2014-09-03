class AddQrCodeToProducts < ActiveRecord::Migration
  def self.up
    add_attachment :products, :qrcode_svg
    add_attachment :products, :qrcode_png
  end
    
  def self.down
    remove_attachment :products, :qrcode_svg
    remove_attachment :products, :qrcode_png
  end
end
