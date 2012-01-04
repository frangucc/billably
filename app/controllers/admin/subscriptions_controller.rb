class Admin::SubscriptionsController < Admin::AdminController
  inherit_resources

  def new
    @subscription = Subscription.new
    3.times { @subscription.packages.build }
    new!
  end

  private

    def showed_columns
      %w(
        is_active area blurb etc featured fine_print description
        merchant_id name offering order refundable
        shipping_info shipping_radius_in_miles ships_nationally zipcode )
      @categories = Category.all
    end
end
