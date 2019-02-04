class Api::V1::TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :elapsed_time, :project_id
  belongs_to :project
end
