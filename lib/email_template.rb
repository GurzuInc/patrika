require "blog_grabber"
require "knowledge_ninja"
require "announcement"
require "liquid"

class EmailTemplate
  def initialize
    @template_content = File.open("./patrika_template.html.liquid")
    @newsletter_contents = [] 
    [BlogGrabber, KnowledgeNinja, Announcement].each {|klass| @newsletter_contents += klass.new.patrika_contents}
  end

  def get_email_contents(username, month)
    Liquid::Template.parse(@template_content.read).render('username'=>"sagun shrestha", 'month'=>"September", 'posts'=>@newsletter_contents)
  end
end