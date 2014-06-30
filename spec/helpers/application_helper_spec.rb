require 'spec_helper'

describe ApplicationHelper do
	describe "full_title" do
		it "includes page title" do
			expect(full_title("foo")).to match(/foo/)
		end

		it "includes base title" do
			expect(full_title("foo")).to match(/^Happs/)
		end

		it "does not include a bar if missing page title" do
			expect(full_title("")).not_to match(/\|/)
		end
	end
end
