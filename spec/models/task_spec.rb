require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'assosiations' do
    it { should belong_to(:user) }
  end

  # describe 'validations' do
  #   subject { FactoryGirl.create(:task) }

  #   context 'valid' do
  #     it { should validate_presence_of(:title) }
  #     it { should validate_presence_of(:priority) }
  #     it { should validate_numericality_of(:priority) }
  #     it { should validate_presence_of(:due_date) }
  #   end
  # end
end
