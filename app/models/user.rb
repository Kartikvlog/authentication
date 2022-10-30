class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :companies

  ROLES = %w{super_admin admin manager}
#meta programming
ROLES.each do |role_name|
	define_method "#{role_name}?" do
		role == role_name
	end
end

#without meta programming
  # def super_admin?
  # 	role == 'super_admin'
  # end

  # def admin?
  # 	role == 'admin'
  # end

  # def manager?
  # 	role == 'manager'
  # end

  # def jwt_payload
  #   super
  # end

end
