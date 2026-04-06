class ApplicationMailer < ActionMailer::Base
# ActionMailerの基礎をApplicationMailerに継承させる
  default from: "from@example.com"
  layout "maile"
end