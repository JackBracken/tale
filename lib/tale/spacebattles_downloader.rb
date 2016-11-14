require 'rubygems'
require 'open-uri'
require 'nokogiri'

module Tale
  # https://forums.spacebattles.com/threads/the-scaly-raptor-jurassic-world.347113/
  class SpacebattlesDownloader
    def initialize(uri)
      @uri = uri
      @title ||= ''
      @author ||= ''
    end

    # Ensure the post exists
    def validate post
    end

    # Fetch the first post in the thread
    def first_post
      page = Nokogiri::HTML(open(@uri))
      
      set_title page
      set_author page

      puts @title
      puts @author
    end

    def set_title page
      @title = page.css('.titleBar h1')[0].text
    end

    def set_author page
      @author = page.css('a.username')[0].text
    end
  end
end

fic_url =  'https://forums.spacebattles.com/threads/the-scaly-raptor-jurassic-world.347113/'

fic = Tale::SpacebattlesDownloader.new(fic_url)
fic.first_post
