require 'spec_helper'

describe "FakeLogins" do
  describe 'when user enter fake password' do
    let(:user) { FactoryGirl.create :user }
    before do
      visit new_user_session_path
      fill_in 'user_email', with: user.password
      fill_in 'user_password', with: user.fake_password
      click_button 'Sign in'
    end
    it "should be redirected to fake page" do
      current_path.should  eq data_path
    end
    it "access should be denied" do
      visit root_path
    end
  end
end
