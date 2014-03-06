# preamble:
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
dom = Nokogiri::HTML(open("webpage.html")) 

# css method:
page = Nokogiri::HTML(open(PAGE_URL))
   
puts page.css("title")[0].name   # => title
puts page.css("title")[0].text   # => My webpage

# Note: The css method returns an array - more specifically a Nokogiri
# data object that is a collection of Nokogiri::XML::Element objects. 
# These element objects have a variety of methods, including text, which
# does return the text contained in the element.

# Getting an attribute of an element:
# The attributes of an element are provided in hash form.

page = Nokogiri::HTML(open(PAGE_URL))
links = page.css("a")
puts links.length   # => 6
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com

# The [0] notation is necessary because the returned object
# is always an array - even if that array has only one element.
# The hash functionality is implemented above to select the 
# value corresponding to the 'href' key of the first element.