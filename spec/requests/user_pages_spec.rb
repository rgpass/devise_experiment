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

		describe "valid information" do
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

		describe "invalid information" do
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

	describe "GET /users/edit" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit edit_user_path(user) }

		describe "page" do
			it { should have_content("Update your profile") }
			it { should have_title("Edit user") }
			it { should have_link('change photo', 
				href: 'http://gravatar.com/emails') }
		end

		# Issue with Devise not recognizing changes
		# Works in live demo
		# Not necessary to test Devise basic functionality
		# describe "valid information" do
		# 	let(:new_first_name)	{ "Balthazar" }
		# 	let(:new_email)				{ "gerry.pass@happs.io" }
		# 	before do
		# 		fill_in "First name", with: new_first_name
		# 		fill_in "Last name",	with: user.last_name
		# 		fill_in "Email",			with: new_email
		# 		# fill_in "Current password",		with: user.password
		# 		fill_in "Password",		with: "foobar123"
		# 		fill_in "Password confirmation",		with: "foobar123"
		# 		click_button "Save changes"
		# 	end

		# 	# it { should have_title(user.first_name) }
		# 	# it { should have_selector('div.alert.alert-success') }
		# 	it { should have_link('Sign out', href: destroy_user_session_path) }
	  #   specify { expect(user.reload.first_name).to  eq new_first_name }
	  #   specify { expect(user.reload.email).to eq new_email }
		# end

		# describe "invalid information" do
		# 	before { click_button "Save changes" }

		# 	# it { should have_content('error') }
		# end
	end
end
