class KnowledgeFormatter
  def initialize(knowledge)
    @knowledge = knowledge
  end

  def format
    [get_title, URI.extract(@knowledge['text']).sample, humanize(@knowledge['text']) ]
  end

  def get_title
    if @knowledge['attachments']
      title = @knowledge['attachments'].first['text']
    else
      title = "Come find me luke!"
    end
    return title
  end

  def humanize (value, options = {})
    if options.empty?
      options[:format] = :sentence
    end
    values = []
    if value.include? '_'
      values = value.split('_')
      values.each { |v| v.downcase! }  
      if options[:format] == :allcaps
        values.each do |value|
          value.capitalize!
        end
        if options.empty?
          options[:seperator] = " "
        end
        return values.join " "
      end
      if options[:format] == :class
        values.each do |value|
          value.capitalize!
        end
        return values.join ""
      end

      if options[:format] == :sentence
        values[0].capitalize!
        return values.join " "
      end
      if options[:format] == :nocaps
        return values.join " "
      end
    end
  end
end