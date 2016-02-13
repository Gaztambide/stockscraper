require 'httparty'
require 'nokogiri'
require 'active_support/all'
require 'sinatra'

get '/' do

ticker = "aapl"
  response = HTTParty.get("http://finance.yahoo.com/q?uhb=uhb2&fr=uh3_finance_vert_gs&type=2button&s=#{ticker}")

  dom = Nokogiri::HTML(response.body)

  my_span = dom.xpath("//span[@id='yfs_l84_#{ticker}']").first
   "#{ticker} $#{my_span.content}"

end
