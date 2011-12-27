require 'spec_helper'

describe Image do
  describe "Associations" do
    it { should belong_to :merchant }
    it { should belong_to :package }
  end

  describe 'Database Columns' do
    it { should have_db_column(:attachment).of_type(:string) }
  end

  describe 'Validations' do
    describe 'should validate that either merchant or package exist' do
      it 'validates merchant exists' do
        pending
      end

      it 'validates merchant exists' do
        pending
      end

      it 'fails if neither exist' do
        pending
      end
    end

  end
end
