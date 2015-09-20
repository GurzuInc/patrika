require 'mechanize'

class BlogGrabber

  def initialize
    @mechanize = Mechanize.new
    @page = @mechanize.get('http://jyaasa.com/blogs/')
    @node = @page.search(".blog-list a")
    @this_months_link = []
  end

  def get_this_months_post
    @node.each do |link|
      link_contents = Mechanize::Page::Link.new(link, @mechanize, @page)
      post_date_str = link_contents.click.search(".blog-layout .right-sidebar h3").first.text
      link.attributes["href"].value = "http://jyaasa.com" + link.attributes["href"].value
      @this_months_link << link if is_this_months_post?(post_date_str)
    end
    @this_months_link
  end

  def is_this_months_post?(date_str)
    post_month = Date.parse(date_str).month
    post_month == Date.today.month ? true : false
  end
end


this_months_post_links = BlogGrabber.new.get_this_months_post