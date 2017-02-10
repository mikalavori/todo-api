class UserAuth
  ALGORITHM = 'HS256'

  def self.token(user)
    JWT.encode({ user_id: user.id }, hmac_secret, ALGORITHM)
  end

  def self.hmac_secret
    Rails.application.secrets.secret_key_base
  end
end
