require "minitest/autorun"
require_relative "../../google_universal_analytics"

describe GoogleUniversalAnalytics::Finder do
  before do
    @finder = GoogleUniversalAnalytics::Finder.new("my_github_repo")
  end

  describe "when asked about the application name" do
    it "must respond with the correct application name" do
      _(@finder.application_name).must_equal "my_github_repo"
    end
  end
end
