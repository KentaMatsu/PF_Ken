class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to:   ENV['TOMAIL'], title: '【お問い合わせ】' + @contact.title
  end
end
