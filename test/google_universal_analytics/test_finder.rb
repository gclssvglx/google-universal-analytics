
require 'simplecov'
SimpleCov.start
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

  describe "when asked to build a grep command" do
    it "responds with the correct command" do
      expected = "grep -E 'track-action|track_action|data-track-action|data_track_action|track-category|track_category|data-track-category|data_track_category' -r --exclude-dir={./tmp,./log,./node_modules,./git,./spec/javascripts/vendor} -n . > ../my_github_repo.txt"
      _(@finder.build_grep).must_equal expected
    end
  end
  
  describe "when asked to build a list of tracking attributes" do
    it "responds with the correct list" do
      expected= "track-action|track_action|data-track-action|data_track_action|track-category|track_category|data-track-category|data_track_category"
      _(@finder.build_tracking_attributes).must_equal expected
    end
  end

  describe "when asked for the list of tracking attributes" do
    it "responds with the list of tracking attributes" do
      expected = ["track-action", "track-category"]
      _(@finder.tracking_attributes).must_equal expected
    end
  end

  describe "when given a data attribute " do
    it "returns an array containing the attribute and the attribute with the hypens replaced by underscores" do
      expected = ["track-action", "track_action"]
      _(@finder.underscore("track-action")).must_equal expected
    end
  end

  describe "when asked for directories to ignore" do
    it "returns a list of directories" do
      expected = "{./tmp,./log,./node_modules,./git,./spec/javascripts/vendor}"
      _(@finder.excluded_directories).must_equal expected
    end
  end
end

