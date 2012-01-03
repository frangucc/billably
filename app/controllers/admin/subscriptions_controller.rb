class Admin::SubscriptionsController < Admin::AdminController 
  inherit_resources

  private
  def showed_columns
    @showed_columns ||= ['area', 'featured', 'merchant_id', 'name', 'long_description', 'fine_print', 'shipping_radius_in_miles', 'ships_nationally', 'order', 'zipcode', 'offering', 'shipping_info', 'refundable', 'etc']
  end
end
