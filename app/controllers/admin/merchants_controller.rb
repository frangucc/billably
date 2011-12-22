class Admin::MerchantsController < Admin::AdminController 
  inherit_resources

  private
  def showed_columns
    @showed_columns ||= ['email', 'name', 'zipcode', 'featured']
  end
end
