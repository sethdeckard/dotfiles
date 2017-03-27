Pry.editor = "#{ENV['EDITOR']}"

begin
  require 'awesome_print'
  AwesomePrint.pry!
  # enable pry paging 
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
  puts 'awesome_print gem not installed'  
end
