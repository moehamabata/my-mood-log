class ApplicationController < ActionController::Base
<<<<<<< HEAD
# ApplicationControllerにActionControllerの親クラスを継承させる 
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :set_no_cache

  private

  def set_no_cache
    response.headers["Cache-Control"] = "no-store, no-cache, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end
=======
  # Railsが提供している基本機能のそのものをApplicationControllerクラスが継承する

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
>>>>>>> 15e83568e23540d107d48e9b5f9898576315dcad
end
