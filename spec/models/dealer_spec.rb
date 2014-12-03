require 'spec_helper'

describe Dealer do
  subject(:dealer) { build(:dealer) }

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

      subject.full_address.should == '1234 Haveanaddress Blvd., Test, OK, 11111'
    end

    # Failing Test
    it 'returns properly when no address has been entered' do
      subject.city = 'Test'
      subject.state = 'OK'
      subject.zip = '11111'

      subject.full_address.should == 'Test, OK, 11111'
    end
  end
end
