class ApplicationMailer < ActionMailer::Base
<<<<<<< HEAD
# ActionMailerの基礎をApplicationMailerに継承させる
  default from: "from@example.com"
  layout "mailer"
=======
# ACtionMailer::BaseのRails on Railsをclass ApplicationMailerに継承させる
  default from: "from@example.com"
# 特に変更がなければ "from@example.com"が使われる
  layout "mailer"
# 
>>>>>>> 15e83568e23540d107d48e9b5f9898576315dcad
end
