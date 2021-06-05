json.extract! product, :id, :name, :description, :stock, :price, :skul, :created_at, :updated_at
json.url product_url(product, format: :json)
