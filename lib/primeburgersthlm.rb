require "primeburgersthlm/version"

module Primeburgersthlm
  DAGENS_DATUM = Time.now.strftime('%-d %b %Y')

  def fetch_burger(datum)
    begin
      content = Nokogiri::XML(open("https://www.facebook.com/feeds/page.php?format=rss20&id=530367483660523"))
      dagens_burgare = content.xpath("//item/pubDate[contains(.,'#{datum}')]/../description").text
      binding.pry
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