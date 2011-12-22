class Admin::PackagesController < Admin::AdminController 
  inherit_resources

  private
  def showed_columns
    @showed_columns ||= ['category_id', 'delivery_date', 'frequency', 'price', 'name', 'subscription_id']
  end
end
