describe Gateway::GoogleSpreadsheet do
  VCR.use_cassette('response') do
    rows = described_class.new.all
    context 'viewing the row' do
      it 'can show the request' do
        rows[0].tap do |row|
          expect(row[0]).to eq('Timestamp')
          expect(row[1]).to eq('Email address')
          expect(row[2]).to eq('Requested by')
        end
      end
    end
  end
end
