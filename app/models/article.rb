class Article < ApplicationRecord
 
 def self.get_data
  url = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=0a708bae59cd4f92b26a6bc4c114f1f0"
   begin
    response = RestClient.get(url, { content_type: :json, accept: :json })
    if response.code == 200
     data = JSON.parse(response)
     data.with_indifferent_access
    end
  rescue => e
    Rails.logger.info("error fetching from cync #{url}: #{e}")
    return {}
  end
  end
end
