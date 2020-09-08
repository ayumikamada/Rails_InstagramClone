class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "dmrdmr58@gmail.com", subject: "新規投稿の通知"
  end
end
