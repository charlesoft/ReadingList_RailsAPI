class GenreSerializer < ActiveModel::Serializer
  attributes :id

  embed :ids
  has_many :books
end
