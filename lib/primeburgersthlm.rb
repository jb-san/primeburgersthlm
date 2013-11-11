require "primeburgersthlm/version"
require "Nokogiri"
require "open-uri"
module Primeburgersthlm
  # datum should be formated like: "6 Nov 2013"

  def self.fetch_burger(datum)
    begin
      content = Nokogiri::XML(open("https://www.facebook.com/feeds/page.php?format=rss20&id=530367483660523"))
      dagens_burgare = content.xpath("//item/pubDate[contains(.,'#{datum}')]/../description").text
      if dagens_burgare.empty?
        raise 'NO BURGER!!!!'
      else
        return dagens_burgare
      end
    rescue Exception => e
      return e.inspect
    end
  end
end