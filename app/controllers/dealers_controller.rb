class DealersController < ApplicationController

  helper_method :get_state_options_for_select

  before_filter do
    authenticate_user! if request.format.json? || request.format.xml?
  end

  def index  
    @dealers = Dealer.order('name')
    respond_to do |format|
      format.html
      format.xml { render xml: @dealers }
      format.json { render json: @dealers }
    end
  end

  def new
    @dealer = Dealer.new
  end

  def create
    @dealer = Dealer.create(dealer_params)
    redirect_to dealers_path, notice: "Dealer #{@dealer.name} created."
  end

  def edit
    @dealer = Dealer.find(params[:id])
  end

  def update
    @dealer = Dealer.find(params[:id])
    @dealer.update(dealer_params)
    redirect_to dealers_path, notice: "Dealer #{@dealer.name} updated."
  end

  def show
    @dealer = Dealer.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render xml: @dealer }
      format.json { render json: @dealer }
    end
  end

  def destroy
    @dealer = Dealer.find(params[:id])
    @dealer.destroy
    redirect_to dealers_path, notice: "Dealer #{@dealer.name} destroyed."
  end

protected

  def get_state_options_for_select
    [
      ["Alaska", "AK"],
      ["Alabama", "AL"],
      ["Arkansas", "AR"],
      ["American Samoa", "AS"],
      ["Arizona", "AZ"],
      ["California", "CA"],
      ["Colorado", "CO"],
      ["Connecticut", "CT"],
      ["District of Columbia", "DC"],
      ["Delaware", "DE"],
      ["Florida", "FL"],
      ["Georgia", "GA"],
      ["Guam", "GU"],
      ["Hawaii", "HI"],
      ["Iowa", "IA"],
      ["Idaho", "ID"],
      ["Illinois", "IL"],
      ["Indiana", "IN"],
      ["Kansas", "KS"],
      ["Kentucky", "KY"],
      ["Louisiana", "LA"],
      ["Massachusetts", "MA"],
      ["Maryland", "MD"],
      ["Maine", "ME"],
      ["Michigan", "MI"],
      ["Minnesota", "MN"],
      ["Missouri", "MO"],
      ["Mississippi", "MS"],
      ["Montana", "MT"],
      ["North Carolina", "NC"],
      ["North Dakota", "ND"],
      ["Nebraska", "NE"],
      ["New Hampshire", "NH"],
      ["New Jersey", "NJ"],
      ["New Mexico", "NM"],
      ["Nevada", "NV"],
      ["New York", "NY"],
      ["Ohio", "OH"],
      ["Oklahoma", "OK"],
      ["Oregon", "OR"],
      ["Pennsylvania", "PA"],
      ["Puerto Rico", "PR"],
      ["Rhode Island", "RI"],
      ["South Carolina", "SC"],
      ["South Dakota", "SD"],
      ["Tennessee", "TN"],
      ["Texas", "TX"],
      ["Utah", "UT"],
      ["Virginia", "VA"],
      ["Virgin Islands", "VI"],
      ["Vermont", "VT"],
      ["Washington", "WA"],
      ["Wisconsin", "WI"],
      ["West Virginia", "WV"],
      ["Wyoming", "WY"]
    ]
  end

private

  def dealer_params
    params.require(:dealer).permit(:name, :address, :city, :state, :zip)
  end

end
