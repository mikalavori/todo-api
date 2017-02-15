class AuthorizeRequest
  attr_reader :headers

  def self.call(headers)
    new(headers).call
  end

  def initialize(headers)
    @headers = headers
  end

  def call
    if encripted_token && user
      [:ok, user]
    else
      :fail
    end
  rescue JWT::DecodeError
    :fail
  rescue JWT::ExpiredSignature
    :expired
  end


  private

  def user
    @user ||= User.find_by_id user_id
  end

  def decripted_token
    UserAuth.decode encripted_token
  end

  def encripted_token
    @encripted_token ||= if headers['Authorization'].present?
      headers['Authorization'].split(' ').last
    end
  end

  def user_id
    decripted_token.first['data']['user_id']
  end
end
