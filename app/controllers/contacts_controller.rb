class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
  end

  def edit
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver  ##追記
      redirect_to pictures_path, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
  
end
