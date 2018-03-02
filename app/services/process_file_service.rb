class ProcessFileService
  KIND_TRANSACTION = ['1', '4']
  attr_reader :file, :type_transaction, :date, :value, :cpf, :card

  def initialize(file)
    @file = file
  end

  def process_file
    File.readlines(@file).each do |line|
      next unless kind_transaction(line)
      find_file(line)
      create_process_file
    end
  end

  private

  def kind_transaction(line)
    KIND_TRANSACTION.include? line[0]
  end

  def find_file(line)
    @type_transaction = line[0]
    @date = (line[1..8] + line[42..47])
    @value = line[9..18]
    @cpf = line[19..29]
    @card = line[30..41]
  end

  def create_process_file
    ProcessFile.create(
      type_transaction: @type_transaction,
      date: @date,
      value: @value,
      cpf: @cpf,
      card: @card
    )
  end
end
