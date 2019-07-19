describe 'the requestinator' do
  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_requests) { UseCase::ViewRequests.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_requests.execute }

  it 'views all delivery teams' do
    VCR.use_cassette('response') do
      expect(response[1]).to eq([
        "2019-07-01",
        "george@madetech.com",
        "George",
        "MoJ",
        "Requestinator",
        "2 weeks",
        "Manchester",
        "10/10/10",
        "1",
        "React",
        "Software Engineer", "comment", "FALSE", "FALSE", "response"])
    end
  end
end
