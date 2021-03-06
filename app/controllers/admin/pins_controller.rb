class Admin::PinsController < Admin::ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_privileges!, except: [:index, :show]

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def new
    @pin = current_user.pins.build
  end

  def show
  end

  def create
    @pin = current_user.pins.build(pin_params) rescue Pin.new

    if @pin.save
      flash[:success] = "Your pin has been created!"
      redirect_to @pin
    else
      flash[:alert] = "Your new pin couldn't be created!  Please check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @pin.update(pin_params)
      flash[:success] = "Pin updated!"
      redirect_to @pin
    else
      flash[:alert] = "Add more information!"
      render :edit
    end
  end


  def destroy
    @pin.destroy
    redirect_to @pin
  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image, :comment)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

  def check_privileges!
    unless current_user.admin?
      flash[:alert] = 'You dont have enough permissions to be here'
      redirect_to @pin
    end
  end
end