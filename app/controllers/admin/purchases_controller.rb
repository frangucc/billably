class Admin::PurchasesController < Admin::AdminController 
  inherit_resources

  private
  def showed_columns
    @showed_columns ||= ['purchase_date', 'package_id', 'price', 'user_id']
  end
end
