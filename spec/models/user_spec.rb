require 'spec_helper'

describe User do
  before { @user = User.new(first_name: "Gerry", last_name: "Pass", 
  	email: "rgpass@gmail.com", password: "foobar123") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "first name" do
  	describe "not present" do
  		before { @user.first_name = " " }
  		it { should_not be_valid }
  	end

  	describe "too long" do
  		before { @user.first_name = "a" * 21 }
  		it { should_not be_valid }
  	end
  end

  describe "last name" do
  	describe "not present" do
  		before { @user.last_name = " " }
  		it { should_not be_valid }
  	end

  	describe "too long" do
  		before { @user.last_name = "a" * 31 }
  		it { should_not be_valid }
  	end
  end

  describe "email" do
  	describe "when address already taken" do
  		before do
  			user_with_same_email = @user.dup
  			user_with_same_email.email = @user.email.upcase
  			user_with_same_email.save
  		end

  		it { should_not be_valid }
  	end
  end
end
