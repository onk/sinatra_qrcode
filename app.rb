Bundler.require(:default, ENV["APP_ENV"] || "development")

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :inline_templates

  get "/" do
    if params[:url] && !params[:url].empty?
      @qr = RQRCode::QRCode.new(params[:url])
    end
    slim :index
  end
end

__END__

@@ index
doctype html
html
  head
    title Qrcode
  body
    form[action="/" method="GET"]
      input[type="text" name="url" size="60"]
      input[type="submit" value="QRコード生成"]
    - if @qr
      == @qr.as_svg
