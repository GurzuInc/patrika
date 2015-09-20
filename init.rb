APP_ROOT = File.dirname(__FILE__)

$:.unshift( File.join(APP_ROOT, 'lib') )

require 'email_template'

puts EmailTemplate.new.get_email_contents("Sagun Shrestha", "September")