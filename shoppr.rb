require "pry"
require "httparty"

results = HTTParty.get("https://api.gilt.com/v1/products?q=jeans&store=women&apikey=363a9cbd2888c4a7a25645f56ffa20a0")
def parse_gilt_results(x)

  gilt_results = {}

  #gilt_result should be a hash where the keys are product names and the values
  #are sub-hashes of the other information

  x["products"].each do |product|

    gilt_results[product["name"]] = {
      "brand"=>product["brand"],
      "description" => product["content"]["description"],
      "sale price" => product["skus"][0]["sale_price"],
      "size" => product["skus"][0]["attributes"][0]["value"],
      "image" => product["image_urls"]["1080x1440"][0]["url"]
    }
  end

  gilt_results
end

g = parse_gilt_results(results)
binding.pry