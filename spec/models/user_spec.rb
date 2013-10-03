require "spec_helper"
describe User do
  before {@user = User.new(name: "U1", email: "u1@gmail.com",
                           password: "1111", password_confirmation: "1111")}
  subject{@user}
  describe "respond " do
    it {should respond_to(:name)}
    it {should respond_to(:password_digest)}
    it {should respond_to(:email)}
    it { should respond_to(:feed) }
    it { should respond_to(:relationships) }
    it { should respond_to(:relationships) }
    it { should respond_to(:followed_users) }
    it {should_not be_admin}
    it {should respond_to(:microposts)}
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

  describe "with admin set to true" do
    before do
      @user.save
      @user.toggle!(:admin)
    end
    it {should be_admin}
  end

  describe "have microposts" do
    before{@user.save}
    let!(:micropost) do
      FactoryGirl.create(:micropost, user: @user)
    end
    it "should have micropost" do
      expect(@user.microposts.first).to eq micropost
    end
    it "it should not have micropost" do
      micropost = @user.microposts.first
      @user.destroy
      expect(Micropost.where(id: micropost.id)).to be_empty
    end
  end
end

