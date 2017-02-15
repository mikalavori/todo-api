class UserAuth
  ALGORITHM = 'HS256'

  def self.token(user)
    JWT.encode({ data: { user_id: user.id }, exp: Time.now.to_i + 4 * 3600 }, hmac_secret, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, hmac_secret, true, { algorithm: ALGORITHM })
  end

  def self.hmac_secret
    Rails.application.secrets.secret_key_base
  end
end
