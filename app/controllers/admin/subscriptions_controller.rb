class Admin::SubscriptionsController < Admin::AdminController
  inherit_resources

  private

    def showed_columns
      %w(
        area blurb etc featured fine_print description
        merchant_id name offering order refundable
        shipping_info shipping_radius_in_miles ships_nationally zipcode )
    end
end
