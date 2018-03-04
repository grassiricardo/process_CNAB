require 'rails_helper'

RSpec.describe ProcessFileService, type: :service do
  subject { described_class.new(file_fixture('cnab.txt')) }

  describe 'process_file' do
    it 'import file and count created process files' do
      subject.process_file

      expect(ProcessFile.count).to eq(4)

      expect(ProcessFile.first.type_transaction).to eq(1)
      expect(ProcessFile.first.date).to eq('2018-03-02 02:30:00')
      expect(ProcessFile.first.value.to_s).to eq('10001.0')
      expect(ProcessFile.first.cpf).to eq('04056147647')
      expect(ProcessFile.first.card).to eq('1234****7890')

      expect(ProcessFile.last.type_transaction).to eq(4)
      expect(ProcessFile.last.date).to eq('2018-06-01 13:00:00')
      expect(ProcessFile.last.value.to_s).to eq('99100.0')
      expect(ProcessFile.last.cpf).to eq('04056147647')
      expect(ProcessFile.last.card).to eq('1234****2231')
    end
  end
end
