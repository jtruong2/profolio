require 'rqrcode'

class QrCode
  def generate_qr(url)
    qrcode = RQRCode::QRCode.new(url)
    png = qrcode.as_png(resize_gte_to: false,resize_exactly_to: false, fill: 'white', color: 'black', size: 120, border_modules: 4, module_px_size: 6, file: nil)
    str = png.to_s.force_encoding("UTF-8")
    IO.write("public/qrcode.png", str)
  end
end
