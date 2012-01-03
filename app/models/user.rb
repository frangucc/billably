class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  concerned_with :user_active_record

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_authentication(conditions={})
    user = find(:first, :conditions => conditions)
  end

  def apply_omniauth(omniauth)
    secret = omniauth['credentials']['secret']
    token = omniauth['credentials']['token']
    omniauth_params = {
      :provider => omniauth ['provider'],
      :uid      => omniauth['uid'],
      :token    => token,
      :secret   => secret }
    self.authentications.build omniauth_params
    self.confirmed_at ||= Time.now
  end

  # Override the `password_required?` Devise method to determine if a
  #   password is required
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
