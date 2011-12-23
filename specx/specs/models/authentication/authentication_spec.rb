require 'specx_helper'

support_require 'database'
app_require 'app/models/authentication'

describe Authentication do
  describe "Associations" do
    it { should belong_to :user}
  end

  describe "Database Columns" do
    it { should have_db_column(:provider) }
    it { should have_db_column(:secret) }
    it { should have_db_column(:token) }
    it { should have_db_column(:uid) }
    it { should have_db_column(:user_id) }
  end
end
