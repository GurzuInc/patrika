require 'httparty'
require 'pp'

require File.join(File.dirname(__FILE__),'configurations.rb')

class KnowledgeNinja
  def initialize
    @token = CONFIG['slack_authorization_token']
    @base_uri = 'https://slack.com/api/rtm.start'
  end

  def teaminfo
   # pp Partay.post('/pears.xml', options) 
  end

  def channel
    
  end

end 
