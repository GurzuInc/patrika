require 'mechanize'
class KnowledgeFormatter
  def initialize(knowledge)
    @knowledge = knowledge
    @link = nil
    @title = nil
    @text = nil
  end

  def format
    set_link
    set_title_and_text
    return [@title, @link, @text]    
  end

  def set_title_and_text
    if @knowledge['subtype']=="file_share"
      @title = @knowledge['file']['name']
      @text = @knowledge['text']
    else
      agent = Mechanize.new
      page = agent.get(@link)
      @title = page.title
      @text = page.search('body').text.gsub('\n',' ').slice(20..100)  # THIS IS VERY BASIC AND ROUGH 
    end
  end

  def set_link
      @link = URI.extract(@knowledge['text']).last
  end

  
  
end