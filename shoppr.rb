require "pry"
require "httparty"

results = HTTParty.get("https://api.gilt.com/v1/products?q=jeans&store=women&apikey=363a9cbd2888c4a7a25645f56ffa20a0")
def parse_gilt_results(results)
  results["products"].each do |product|
  end
end