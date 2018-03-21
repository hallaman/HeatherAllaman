class ContactsController < ApplicationController

  layout 'application'

  def index

  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    # @contact.request = request
    if @contact.valid?
      @contact.deliver
      flash.now[:notice] = 'Thank you for your message, I will be in contact soon!'
    else
      flash.now[:error] = @contact.errors.full_messages.join(". ")
      render :new
    end
  end

end

