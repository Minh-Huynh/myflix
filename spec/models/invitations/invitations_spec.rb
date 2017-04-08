require 'spec_helper'

describe Invitation do
  it {should validate_presence_of(:invite_token)}
  it {should validate_presence_of(:email)}
end
