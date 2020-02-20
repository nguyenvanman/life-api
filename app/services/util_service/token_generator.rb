module UtilService::TokenGenerator

  def self.call(account)
    payload = {
      user_id: account.user_id,
      email: account.email
    }
    UtilService::JsonWebToken.encode(payload)
  end

end