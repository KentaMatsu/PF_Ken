class Admins::ContactsController < ApplicationController

  before_action :authenticate_admin!

end
