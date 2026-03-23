class ApplicationMailer < ActionMailer::Base
# ACtionMailer::BaseのRails on Railsをclass ApplicationMailerに継承させる
  default from: "from@example.com"
# 特に変更がなければ "from@example.com"が使われる
  layout "mailer"
# 
end
