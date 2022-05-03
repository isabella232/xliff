# frozen_string_literal: true

RSpec.describe Xliff::File do
  describe '#initialize' do
    it 'properly stores the original' do
      expect(new_file(original: 'test').original).to eq 'test'
    end

    it 'properly stores the source_language' do
      expect(new_file(source_language: 'en').source_language).to eq 'en'
    end

    it 'properly stores the target_language' do
      expect(new_file(target_language: 'fr').target_language).to eq 'fr'
    end

    it 'uses `plaintext` as the default datatype' do
      expect(new_file.datatype).to eq 'plaintext'
    end

    it 'properly stores the datatype' do
      expect(new_file(datatype: 'php').datatype).to eq 'php'
    end

    it 'has no files by default' do
      expect(new_file.entries).to be_empty
    end

    it 'has no headers by default' do
      expect(new_file.headers).to be_empty
    end
  end

  describe '.to_xml' do
    it 'produces valid XML' do
      expect(new_file.to_xml).to be_a Nokogiri::XML::Element
    end

    it 'has the root node <file>' do
      expect(new_file.to_xml.name).to eq 'file'
    end

    describe '<file>' do
      it 'has the correct `original` attribute' do
        expect(new_file(original: 'test').to_xml['original']).to eq 'test'
      end

      it 'has the correct `source-language` attribute' do
        expect(new_file(source_language: 'en').to_xml['source-language']).to eq 'en'
      end

      it 'has the correct `target-language` attribute' do
        expect(new_file(target_language: 'fr').to_xml['target-language']).to eq 'fr'
      end

      it 'has the correct `datatype` attribute' do
        expect(new_file(datatype: 'php').to_xml['datatype']).to eq 'php'
      end

      it 'does not contain the header element by default' do
        expect(new_file.to_xml.at('header')).to be_nil
      end

      it 'does not contain the `body` element by default' do
        expect(new_file.to_xml.at('body')).to be_nil
      end

      it 'contains the `body` element if entries are present' do
        expect(new_file(entries: [new_entry]).to_xml.at('body')).not_to be_nil
      end
    end
  end
end
