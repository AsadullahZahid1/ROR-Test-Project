class ContactsController < ApplicationController
  before_action :authenticate_User!
  def new
   @contact = current_User.contacts.new
  end
  def create
    @contact= Contact.new(contact_params)
    @contact.user_id = current_User.id
    # @contact.user=current_User

    if @contact.save
      flash[:success]="Message has been sent successfully"
      redirect_to posts_path
    else
      render new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:subject, :message, :user_id)
  end


end
