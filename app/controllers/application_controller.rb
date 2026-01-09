class ApplicationController < ActionController::Base
# ApplicationControllerにActionControllerの親クラスを継承させる 
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
