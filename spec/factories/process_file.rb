FactoryBot.define do
  factory :process_file do
    type_transaction Faker::Number.between(1, 5)
    date Time.now
    value Faker::Number.between(1, 100000)
    cpf '12345612378'
    card '6777****1313'
  end
end
