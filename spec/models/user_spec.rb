require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'assosiations' do
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    # subject { FactoryGirl.create(:task) }

    context 'valid' do
      it { should validate_presence_of(:firstname) }
      it { should validate_presence_of(:lastname) }
      it { should validate_presence_of(:username) }
    end
  end
end
