class DealersController < ApplicationController
  def index
    @dealers = Dealer.order('name')
  end

  def edit
    @dealer = Dealer.find(params[:id])
  end

  def show
    @dealer = Dealer.find(params[:id])
  end

  def destroy
    @dealer = Dealer.find(params[:id])
    @dealer.destroy
    redirect_to dealers_path, notice: "Dealer #{@dealer.name} destroyed."
  end
end
