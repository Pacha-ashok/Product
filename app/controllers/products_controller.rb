class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token  

	def import
		begin
		 file =  "/home/pashok@idexcel.internal/Desktop/product_details.csv"
		  prd = Product.import(file)
		  if prd[:status]  == 'create'
	     render json: { message: 'Data has been sucessfully saved',status: :ok}
	    else
	     render json: { message: 'Data has been sucessfully updated',status: :ok}
	    end
	  rescue StandardError => e
	    logger.info e
	    render json: e.to_s, status: :unprocessable_entity
    end
	end

	def list
    @product = Product.all
    render json: @product, status: :ok
	end

	def fetch_data
		@article =  Article.get_data
    save_data
	end
  

  def save_data
    begin
			articals = []
			@article["articles"].each do |article|
				art = Article.new
				art.name = article['source']['name']
				art.author = article['author']
				art.title  = article['title']
				art.description = article['description']
				art.url = article['url']
				art.urlToImage = article['urlToImage']
				art.content = article['content']
				if art.valid?
				  articals.push(art)
				end
			end
			article = Article.import(articals, :validate => false) if articals.present?
		  if article.present?
       render json: { message: 'Data has been sucessfully saved', status: :ok}
		  end
		rescue StandardError => e
	    logger.info e
	    render json: e.to_s, status: :unprocessable_entity
    end
	end

	def list_article
   @article = Article.all
   render json: @article, status: :ok
	end
end

