require 'spec_helper'

describe DealersController do

  let(:dealer) { create(:dealer) }
  let(:dealers) { create_list(:dealer, 3) }

  describe 'get index' do
    it 'assigns dealers and renders index' do
      get :index
      assigns[:dealers].should == Dealer.order('name')
      response.should render_template('index')
    end
  end

  describe 'get show' do
    it 'renders show' do
      get :show, id: dealer.id
      response.should render_template('show')
    end
  end

  describe 'delete destroy' do
    before(:each) { dealers }

    def do_delete
      delete(:destroy, id: dealers[1].id)
    end

    it 'destroys dealer' do
      lambda {
        do_delete
      }.should change(Dealer, :count).by(-1)
      Dealer.where(id: dealers[1].id).first.should be(nil)
    end

    it 'redirects to index' do
      do_delete
      response.should redirect_to(dealers_path)
    end
  end
end
