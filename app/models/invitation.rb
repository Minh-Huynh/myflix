class Invitation < ActiveRecord::Base
  include Tokenable
  validates_presence_of :email
end
