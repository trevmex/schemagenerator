require File.absolute_path(File.join(File.dirname(__FILE__), 'parser'))

module SchemaMapper
  class Interface
    def initialize(schema, options={:output_dir => File.absolute_path(File.join(File.dirname(__FILE__), '..', 'output'))})
      @interface = SchemaMapper::Parser.new(schema, {:output_dir => options[:output_dir], :template_file_name => 'Schema.java.erb', :language => 'java', :test => false, :impl => false})
    end

    def write_to_file
      @interface.write_to_file
    end

    def directory
      @interface.directory
    end
  end
end