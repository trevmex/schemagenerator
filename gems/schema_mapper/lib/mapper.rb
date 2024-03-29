require File.absolute_path(File.join(File.dirname(__FILE__), 'schema'))
require 'active_support/core_ext/string/inflections'

module SchemaMapper
  class Mapper
    def self.generate(files=[:dsl, :interface, :implementation, :implementation_test], options={:pcakage => "", :output_dir => File.absolute_path(File.join(File.dirname(__FILE__), '..', 'output'))})
      files = [files] unless files.respond_to?(:each)
      #SchemaMapper::Schema.types.each do |type|
      ["VideoObject"].each do |type|
        puts "Getting schema for #{type.titleize}"
        schema = SchemaMapper::Schema.new(type, options[:package])
        lib_dir = File.absolute_path(File.join(File.dirname(__FILE__)))

        files.each do |template|
          eval <<-eos
            require File.join(lib_dir, '#{template}')
            mapped_template = SchemaMapper::#{template.to_s.camelize}.new(schema, {:output_dir => options[:output_dir]})
            puts 'Writing #{type.titleize} #{template.to_s.titleize}'
            mapped_template.write_to_file
          eos
        end
      end
    end
  end
end