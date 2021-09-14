class ContactsController < ApplicationController

  # 入力画面
  def new
    @contact = Contact.new
  end

  # 入力確認
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  # 入力ミスで戻るときに入力データを保持した状態で戻る
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # 入力データ保存
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  # 完了画面
  def done
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:email,:name,:phone_number,:subject,:message)
  end

end
