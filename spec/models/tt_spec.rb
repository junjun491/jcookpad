require 'rails_helper'

RSpec.describe User, type: :model do
    it "is valid with a name, email and password" do
            user = User.new(
                        name: "hoge1",
                                    email: "hoge1@example.com",
                                                password: "password"
                                                        )
                    expect(user).to be_valid
end
end
