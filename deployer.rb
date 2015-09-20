class Deployer
  def deploy
    source = File.expand_path('./')
    response = `rsync -avuz --progress #{source}/ deployer@kapilrajnakhwa.com:/home/deployer/tools/news-letter/`
    puts response
  end
end

d = Deployer.new
d.deploy