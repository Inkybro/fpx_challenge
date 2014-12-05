require 'spec_helper'

describe Dealer do

  # i'm certain there is a better way of doing this.
  before(:all) do
    @tmp_dealer_1 = Dealer.create(name: 'B Dealer', state: 'OK', city: 'Edmond', zip: '73034-1234')
    @tmp_dealer_2 = Dealer.create(name: 'C Dealer', state: 'OK', city: 'Edmond', zip: '73034-1234')
  end

  after(:all) do
    @tmp_dealer_1.destroy
    @tmp_dealer_2.destroy
  end

  subject(:dealer) { build(:dealer, name: 'A Dealer', state: 'OK', city: 'Edmond', zip: '73034-1234') }

  it { is_expected.to be_valid }

  describe '#name' do
    it 'is required' do
      subject.name = ''
      expect(subject).to_not be_valid
      expect(subject.errors[:name].length).to be(1)
    end
  end

  describe '#city' do
    it 'is required' do
      subject.city = ''
      expect(subject).to_not be_valid
      expect(subject.errors[:city].length).to be(1)
    end
  end

  describe '#state' do
    it 'is required' do
      subject.state = ''
      expect(subject).to_not be_valid
      expect(subject.errors[:state].length).to be(2)
    end

    it 'must be 2 characters' do
      subject.state = 'O'
      expect(subject).to_not be_valid
      expect(subject.errors[:state].length).to be(1)

      subject.state = 'Oklahoma'
      expect(subject).to_not be_valid
      expect(subject.errors[:state].length).to be(1)
    end
  end

  describe '#full_address' do
    it 'returns properly when an address has been entered' do
      subject.address = '1234 Haveanaddress Blvd.'
      subject.city = 'Test'
      subject.state = 'OK'
      subject.zip = '11111'

      #subject.full_address.should == '1234 Haveanaddress Blvd., Test, OK, 11111'
      expect(subject.full_address).to eq('1234 Haveanaddress Blvd., Test, OK, 11111')
    end

    # Failing Test
    it 'returns properly when no address has been entered' do
      subject.city = 'Test'
      subject.state = 'OK'
      subject.zip = '11111'

      #subject.full_address.should == 'Test, OK, 11111'
      expect(subject.full_address).to eq('Test, OK, 11111')
    end
  end

  describe "#nearby_dealers" do
    it 'returns a list of dealers in the same city EXCLUDING the current dealer' do
      subject.city = 'Edmond'
      subject.state = 'OK'

      expect(subject.nearby_dealers).not_to include(subject)
      expect(subject.nearby_dealers).to include(@tmp_dealer_1)
      expect(subject.nearby_dealers).to include(@tmp_dealer_2) 
    end
  end
end
