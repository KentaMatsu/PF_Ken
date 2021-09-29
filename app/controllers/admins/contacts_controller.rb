class Admins::ContactsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @contacts = Contact.all.reverse_order
  end

  def show
    @contact = Contact.find(params[:id])
  end

end
