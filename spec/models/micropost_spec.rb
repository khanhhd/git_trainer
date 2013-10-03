require "spec_helper"

describe Micropost do
  let(:user){FactoryGirl.create(:user)}
  before do
   @micropost = user.microposts.build(content: "poster") 
  end
  subject{@micropost}
  it {should respond_to(:content)}
  it {should respond_to(:user_id)}
end
