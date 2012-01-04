class Admin::SubscriptionsController < Admin::AdminController
  inherit_resources

  private
    def showed_columns
      %w(
        area etc featured fine_print long_description
        merchant_id name offering order refundable
        shipping_info shipping_radius_in_miles ships_nationally zipcode )
      @categories = Category.all
    end
end
