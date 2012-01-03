require 'specx_helper'

support_require 'database'

app_require 'app/models/image/image_active_record'

describe Image do
  describe 'Associations' do
    it { should belong_to :merchant }
    it { should belong_to :package }
  end

  describe 'Database Columns' do
    it { should have_db_column(:attachment).of_type(:string) }
    it { should have_db_column(:processing).of_type(:boolean) }
  end

  describe 'Validations' do
  end
end
