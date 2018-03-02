require 'rails_helper'

RSpec.describe ProcessFileService, type: :service do
  subject { described_class.new(file_fixture('cnab.txt')) }

  describe 'process_file' do
    it 'import file and count created process files' do
      subject.process_file

      expect(ProcessFile.count).to eq(4)
    end
  end
end
