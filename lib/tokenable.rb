module Tokenable
  extend ActiveSupport::Concern
  included do
    before_create :generate_invite_token
  end
  private

  def generate_invite_token
    self.invite_token = SecureRandom.urlsafe_base64
  end
end
