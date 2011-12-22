class Admin::CategoriesController < Admin::AdminController
  inherit_resources
  respond_to :html, :xml, :json

  private
  def showed_columns
    @showed_columns ||= ['name', 'featured', 'order']
  end
end
