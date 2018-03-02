json.extract! @debitos do |debito|
  json.type_transaction debito.type_transaction
  json.date debito.date
  json.value debito.value
  json.cpf debito.cpf
  json.card debito.card
end

json.extract! @creditos do |credito|
  json.type_transaction credito.type_transaction
  json.date credito.date
  json.value credito.value
  json.cpf credito.cpf
  json.card credito.card
end
