Given /^a user visits the signin page$/ do
  visit new_user_session_path
end

When /^they submit invalid signin information$/ do
  click_button "Sign in"
end

Then /^they should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(first_name: "Example", last_name: "User", 
									  	email: "user@example.com", password: "foobar123", 
									  	password_confirmation: "foobar123")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^they should see their profile page$/ do
  expect(page).to have_title(@user.first_name)
  expect(page).to have_title(@user.last_name)
end

Then /^they should see a signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end
