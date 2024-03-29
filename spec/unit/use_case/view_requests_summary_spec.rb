describe UseCase::ViewRequestsSummary do
  let(:google_spreadsheet_gateway) { GoogleSheetsSimulator.new }
  let(:view_requests_summary) { described_class.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_requests_summary.execute }

  it 'can return the correct summary data for requests' do
    expect(response).to eq({active:1, in_progress:0})
  end
end