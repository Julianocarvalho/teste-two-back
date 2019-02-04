class Api::V1::ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :elapsed_time
end
