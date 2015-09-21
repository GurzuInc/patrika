require File.join(File.dirname(__FILE__),'lib/configurations.rb')
class Deployer
  def deploy
    source = File.expand_path('./')
    server = CONFIG['server']
    response = `rsync -avuz --progress #{source}/ #{server}:/home/deployer/tools/news-letter/`
    puts response
  end
end

d = Deployer.new
d.deploy