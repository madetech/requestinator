# frozen_string_literal: true

describe UseCase::ViewResolvedRequests do
  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_resolved_requests) { described_class.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_resolved_requests.execute }

  it 'can show client as the first key for the data' do
    VCR.use_cassette('response') do
      expect(response[0]).to eq([
        "19/07/2019 12:02:07",
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
        "s",
        "TRUE",
        "TRUE",
        "Look George, I've left a comment!"
      ])
    end
  end
end
