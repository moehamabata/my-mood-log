require_relative "boot"

require "rails/all"

# Gemfileに記載されたgemをロードします
Bundler.require(*Rails.groups)

module MoodDiary
  class Application < Rails::Application
    # Rails 7.2 のデフォルト設定を読み込み
    config.load_defaults 7.2

    # 自動読み込みの設定
    config.autoload_lib(ignore: %w[assets tasks])

    # タイムゾーンと日本語化の設定
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja

    # バリデーションエラー時にレイアウトが崩れるのを防ぐ設定
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end