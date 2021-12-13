module Recog
class DBManager
  require 'nokogiri'
  require 'recog/db'

  attr_accessor :path, :databases

  $stdout.puts "!!! DBManager !!! File.expand_path(File.dirname(__FILE__)) = #{File.expand_path(File.dirname(__FILE__))}" # TODO: remove
  $stdout.puts "!!! DBManager !!! __dir__ = #{__dir__}" # TODO: remove
  $stdout.puts "!!! DBManager !!! File.expand_path(__dir__) = #{File.expand_path(__dir__)}" # TODO: remove

  # TODO: change to recog
  # DefaultDatabasePath = File.expand_path( File.join( File.dirname(__FILE__), "..", "..", "test-recog", "xml") )
  DefaultDatabasePath = File.expand_path(File.join(File.expand_path(__dir__), ["..", "..", "test-recog", "xml"]))
  $stdout.puts "DefaultDatabasePath = #{DefaultDatabasePath}"

  def initialize(path = DefaultDatabasePath)
    $stdout.puts "!!! DBManager !!! initialize(): path = #{path}; calling reload..." # TODO: remove
    self.path = path
    reload
  end

  def load_databases
    $stdout.puts "!!! DBManager !!! load_databases(): self.path = #{self.path}" # TODO: remove
    if File.directory?(self.path)
      Dir[self.path + "/*.xml"].each do |dbxml|
        $stdout.puts "!!! DBManager !!! load_databases(): dbxml = #{dbxml}" # TODO: remove
        self.databases << DB.new(dbxml)
      end
    else
      $stdout.puts "!!! DBManager !!! load_databases(): single load self.path = #{self.path}" # TODO: remove
      self.databases << DB.new(self.path)
    end
  end

  def reload
    $stdout.puts "!!! DBManager !!! reload(): calling load_databases..." # TODO: remove
    self.databases = []
    load_databases
  end

end
end
