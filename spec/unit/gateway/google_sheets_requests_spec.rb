describe Gateway::GoogleSpreadsheet do
  VCR.use_cassette('response') do
    rows = described_class.new.all
    context 'viewing the row' do
      it 'can show the request' do
        rows[0].tap do |row|
          expect(row[0]).to eq('10/07/2019 10:48:36')
          expect(row[1]).to eq('maysa@madetech.com')
          expect(row[2]).to eq('Maysa')
        end
      end
    end
  end
end
