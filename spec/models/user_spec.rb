require 'rails_helper'

describe User do
  context "when user is present"

    it "is valid with email and password" do
      expect(User.new(email: "test@gmx.de", password: "123456")). to be_valid
    end

    it "is not valid without email" do
      expect(User.new(password: "123456")).not_to be_valid
    end

    it "is not valid without password" do
      expect(User.new(email: "test@gmx.de")).not_to be_valid
    end

end
