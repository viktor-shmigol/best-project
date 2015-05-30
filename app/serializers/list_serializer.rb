class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :assigned, :position
end
