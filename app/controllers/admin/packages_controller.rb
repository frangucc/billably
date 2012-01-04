class Admin::PackagesController < Admin::AdminController 
  inherit_resources

  private
  def showed_columns
    @showed_columns ||= ['category_id', 'delivery_date', 'our_cost', 'customer_cost', 'name', 'description', 'subscription_id']
  end
end
