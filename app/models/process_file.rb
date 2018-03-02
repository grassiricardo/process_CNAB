class ProcessFile < ApplicationRecord
  validates :type_transaction, :date, :value, :cpf, :card, presence: true

  before_save :value_exact, :transform_fuso

  private

  def value_exact
    value.to_d / 100
  end

  def transform_fuso
    date.in_time_zone.utc
  end
end
