class PortfolioPresenter < BasePresenter
  attr_reader :first_name,
              :image,
              :profiles,
              :url

  def initialize(user)
    @first_name = user.first_name
    @image = user.image
    @profiles = user.profiles
    @token = user.token
    @url = "https://profolioplus.herokuapp.com/display?token=#{user.token}"
    @qrcode = qrcode(@url)
  end

  def qrcode(url)
    QrCode.generate_qr(url)
  end
end
