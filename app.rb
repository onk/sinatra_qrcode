Bundler.require(:default, ENV["RACK_ENV"] || "development")

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    if params[:url] && !params[:url].empty?
      @qr = RQRCode::QRCode.new(params[:url])
    end
    slim :index
  end
end
