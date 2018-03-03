require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'validations' do
    before { create(:user) }

    context 'presence' do
      it { validate_presence_of(:email) }
    end

    context 'uniqueness' do
      it { validate_presence_of(:email) }
    end
  end
end
