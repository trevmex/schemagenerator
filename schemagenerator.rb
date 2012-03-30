require File.absolute_path(File.join(File.dirname(__FILE__), 'gems', 'schema_mapper', 'schema_mapper'))

SchemaMapper.map([:interface, :implementation, :implementation_test], {:package => "org.trevreport.schema", :output_dir => File.absolute_path(File.join(File.dirname(__FILE__), 'output'))})