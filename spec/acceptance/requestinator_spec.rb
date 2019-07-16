describe 'the schedulinator' do
  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_requests) { UseCase::ViewRequests.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_requests.execute }

  it 'views all delivery teams' do
    expect(response[1]).to eq(
      ["16/07/2019 10:48:36",
      "maysa@madetech.com",
      "Maysa",
      "Made Tech",
      "Requestinator",
      "2 weeks",
      "London Bridge",
      "3",
      "3",
      "Ruby",
      "Software Engineer, Software Engineer, Academy Engineer", "fffh", "FALSE", "FALSE", "FALSE"])
  end
end
