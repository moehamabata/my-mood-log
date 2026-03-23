class ApplicationController < ActionController::Base
  # Railsが提供している基本機能のそのものをApplicationControllerクラスが継承する

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
