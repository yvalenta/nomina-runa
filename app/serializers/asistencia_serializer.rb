class AsistenciaSerializer < ActiveModel::Serializer
  attributes :id, :entrada, :salida, :counter
  has_one :user
end
