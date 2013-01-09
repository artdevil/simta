class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable,:recoverable,
  devise :database_authenticatable, :registerable,
        :rememberable, :trackable, :authentication_keys => [:id_key]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:id_key, :password, :password_confirmation, :remember_me, :user_type, :address
  # attr_accessible :title, :body
  
  protected
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(id_key) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
