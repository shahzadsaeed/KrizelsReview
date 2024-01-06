json.extract! review, :id, :customer_name, :customer_phone, :created_at, :updated_at
json.url review_url(review, format: :json)
