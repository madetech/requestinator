describe 'the requestinator' do
  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_requests) { UseCase::ViewRequests.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_requests.execute }

  it 'views all delivery teams' do
    VCR.use_cassette('response') do
      expect(response[0]).to eq([
          "10/07/2019 10:48:36",
          "maysa@madetech.com",
          "Maysa",
          "Made Tech",
          "Requestinator",
          "2 weeks",
          "London Bridge",
          "10/10/10",
          "1",
          "Ruby",
          "Software Engineer",
          "Project is bulfing stuff",
          "Bob",
          "FALSE",
          "FALSE",
          "Yasssss"])
    end
  end
end
