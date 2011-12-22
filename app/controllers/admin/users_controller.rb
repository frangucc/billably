class Admin::UsersController < Admin::AdminController 
  inherit_resources

  private
  def showed_columns
    @showed_columns ||= ['email', 'first_name', 'last_name', 'zipcode']
  end
end
