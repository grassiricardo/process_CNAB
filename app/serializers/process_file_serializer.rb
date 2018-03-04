class ProcessFileSerializer < ActiveModel::Serializer
  attributes :id, :type_transaction, :date, :value, :cpf, :card
end
