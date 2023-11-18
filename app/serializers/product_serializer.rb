class ProductSerializer
  include JSONAPI::Serializer
  belongs_to :user
  has_one :category
  attributes :title, :author, :price, :category_id
end
