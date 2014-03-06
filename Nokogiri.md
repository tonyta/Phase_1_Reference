# remember to . . .
require 'nokogiri'


# creating a Nokogiri object
### from url
require 'open-uri'
noko_obj_from_url = Nokogiri::HTML(open("url")))

### from a file

html_file = file.open("filename")
noko_obj_from_file = Nokogirl::HTML(html_file)
html_file.close

# Traversing the DOM
### capturing html elements
noko_obj.css("css_selector")     
=> array of matching html elements

### extracting text node
html_element.text

### grabbing an attributes value
html_element.attribute("attribute_name").value
