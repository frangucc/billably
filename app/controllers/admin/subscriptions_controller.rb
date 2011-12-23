class Admin::SubscriptionsController < Admin::AdminController 
  inherit_resources

  private
  def showed_columns
    @showed_columns ||= ['area', 'featured', 'merchant_id', 'name', 'order', 'zipcode']
  end
end
