module GoogleUniversalAnalytics
  class Finder
    attr_reader :application_name

    def initialize(application_name)
      @application_name = application_name
    end
  end
end
