# frozen_string_literal: true

describe UseCase::ViewRequests do
  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_unresolved_requests) { described_class.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_unresolved_requests.execute }

  it 'can show client as the first key for the data' do
    VCR.use_cassette('response') do
      expect(response[1]).to eq(["2019-07-01",
        "george@madetech.com",
        "George",
        "MoJ",
        "Requestinator",
        "2 weeks",
        "Manchester",
        "10/10/10",
        "1",
        "React",
        "Software Engineer",
        "comment",
        "FALSE", "FALSE", "response"])
    end
  end
end
