require 'spec_helper'

describe "static_pages" do

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_title(full_title(page_title)) }
	end

	describe "header" do
		it "has the correct links" do
			visit root_path
			click_link "Happs"
			expect(page).to have_title(full_title('Welcome'))
			click_link "About"
			expect(page).to have_title(full_title('About'))
			click_link "Sign up"
			expect(page).to have_title(full_title('Sign up'))
		end
	end

  describe "GET /landing" do
  	before { visit landing_path }
  	let(:heading) 		{ 'Welcome!' }
  	let(:page_title)	{ "Welcome" }

  	it_should_behave_like "all static pages"
  end

  describe "GET /about" do
  	before { visit about_path }
  	let(:heading) 		{ 'About' }
  	let(:page_title)	{ "About" }

		it_should_behave_like "all static pages"  	
  end
end
