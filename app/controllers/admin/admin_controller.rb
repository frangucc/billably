class Admin::AdminController < ApplicationController
  before_filter :showed_columns
  layout 'admin'
  before_filter :authenticate_user!
  def showed_columns 
    @showed_columns ||= []
  end
end
