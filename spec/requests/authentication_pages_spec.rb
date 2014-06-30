require 'spec_helper'

describe "authentication_pages" do
	subject { page }

	describe "GET /users/sign_in" do
		before { visit new_user_session_path }

		it { should have_content("Sign in") }
		it { should have_title(full_title("Sign in")) }
	end

	describe "POST /users/sign_in" do
		before { visit new_user_session_path }

		describe "valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email",		with: user.email.upcase
				fill_in "Password", with: user.password
				click_button "Sign in"
			end

			it { should have_link('Profile',			href: user_path(user)) }
			it { should have_link('Sign out',			href: destroy_user_session_path) }
			it { should_not have_link('Sign in',	href: new_user_session_path) }
			it { should_not have_link('Sign up',	href: new_user_registration_path) }
		end

		describe "invalid information" do
			before { click_button "Sign in" }

			it { should have_title("Sign in") }
		end		
	end
end
