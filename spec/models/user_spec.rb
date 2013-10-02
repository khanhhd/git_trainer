require "spec_helper"
describe User do
  before {@user = User.new(name: "U1", email: "u1@gmail.com",
                           password: "1111", password_confirmation: "1111")}
  subject{@user}
  describe "respond " do
    it {should respond_to(:name)}
    it {should respond_to(:password_digest)}
    it {should respond_to(:email)}
  end

  describe "return value of authenticate method" do
    before{@user.save}
    let(:found_user){User.find_by(email: @user.email)}
    context "with valid password" do
      it {should eq found_user.authenticate(@user.password)} 
    end

    context "with invalid password" do
      let(:user_for_invalid_password){found_user.authenticate("invalid")}
      it {should_not eq user_for_invalid_password} 
      specify {expect(user_for_invalid_password).to be_false}
    end
  end

  describe "remember token " do
    before{@user.save}
    its(:remember_token){should_not be_blank}
  end
end
