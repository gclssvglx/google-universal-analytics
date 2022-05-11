module GoogleUniversalAnalytics
  class Finder
    attr_reader :application_name

    def initialize(application_name)
      @application_name = application_name
    end

    def build_grep
      "grep -E '#{build_tracking_attributes}' -r --exclude-dir=#{excluded_directories} -n . > ../#{application_name}.txt"
    end

    def parse_file
      output_file = File.open("../#{application_name}.csv", 'w') 
      lines = File.open("../#{application_name}.txt").readlines
      lines.each do |line|
        filename,linenumber, *rest = line.split(":")
        finding = rest.join(" ").match(build_tracking_attributes)
        output_file.puts("#{filename},#{linenumber},#{finding}")
      end
    end

    def create_csv
      system(build_grep)
      parse_file
    end

    def tracking_attributes
      ["track-action", "track-category"]
    end

    def underscore(attribute)
      [attribute, attribute.gsub("-", "_")]
    end

    def excluded_directories
      "{./tmp,./log,./node_modules,./git,./spec/javascripts/vendor}"
    end

    def build_tracking_attributes
      attributes = []
      tracking_attributes.each do |attribute|
        attributes << underscore(attribute) << underscore("data-#{attribute}")
      end
      attributes.join("|")
    end
  end
end
