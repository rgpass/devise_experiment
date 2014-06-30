require 'spec_helper'

describe "user_pages" do

	subject { page }

	describe "GET /users/sign_up" do
		before { visit new_user_registration_path }

		it { should have_content('Sign up') }
		it { should have_title(full_title('Sign up')) }
	end

	describe "POST /users/sign_up" do
		before { visit new_user_registration_path }

		let(:submit) { "Sign up" }

		describe "valid inputs" do
			before do
				fill_in "First name", with: "Gerry"
				fill_in "Last name",	with: "Pass"
				fill_in "Email",			with: "rgpass@gmail.com"
				fill_in "Password",		with: "foobar123"
				fill_in "Password confirmation", with: "foobar123"
			end

			it "creates a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end

		describe "invalid inputs" do
		end
	end

	describe "GET /users/:id" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.first_name) }
		it { should have_content(user.last_name) }
		it { should have_title(user.first_name) }
		it { should have_title(user.last_name) }
	end
end
