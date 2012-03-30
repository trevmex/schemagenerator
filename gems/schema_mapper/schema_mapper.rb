require File.absolute_path(File.join(File.dirname(__FILE__), 'lib', 'mapper'))

module SchemaMapper
  def self.map(files, options={:package => "", :output_dir => File.absolute_path(File.join(File.dirname(__FILE__), 'output'))})
    Mapper.generate(files, options)
  end
end