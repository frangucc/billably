require 'specx_helper'

support_require 'database'

app_require 'app/models/image/image_active_record'

describe Image do
  describe 'Associations' do
    it { should belong_to :imageable}
  end

  describe 'Database Columns' do
    it { should have_db_column(:attachment).of_type(:string) }
    it { should have_db_column(:processing).of_type(:boolean) }
    it { should have_db_column(:imageable_id).of_type(:integer) }
    it { should have_db_column(:imageable_type).of_type(:string) }
  end

  describe 'Validations' do
  end
end
