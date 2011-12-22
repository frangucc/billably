class RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  private

    def build_resource(*args)
      super
      if session[:omniauth]
        @user.username = session[:omniauth]["info"]["name"]
        @user.encrypted_password = Devise.friendly_token[0,20]
        @user.email = session[:omniauth]["info"]["email"] if session[:omniauth]["info"]["email"]
        @user.apply_omniauth(session[:omniauth])
        @user.valid?
      end
    end
end

