require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = {}
    doc = Nokogiri::HTML(open(index_url))
    doc.css("div.roster-cards-container").each do |container|
      container.css("div.student-card").each do |student|
        name = student.css('.student-name').text
        location = student.css('.student-location').text
        profile = "#{student.attr('href')}"
        students << {name: name, location: location, profile_url: profile}
      end
    end
    students
    # binding.pry
  end

  def self.scrape_profile_page(profile_url)
    profile = Nokogiri::HTML(open(profile_url))
    students_profile = {}
    links = profile.css("div.social-icon-container a").collect {|a| a.attribute("href").value}

  end

end
