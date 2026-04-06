class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :moods, dependent: :destroy

  # パスワードは英字と数字の両方を含む（正規表現）
  # deviseのバリデーションより先に走らせるため、ここに定義
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  # validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は英字と数字の両方を含めてください" }, if: :password_required?
  validates :password, format: { with: VALID_PASSWORD_REGEX }, if: :password_required?


  private

  # パスワードが必要な時（新規登録やパスワード変更時）だけバリデーションをかける判定
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end