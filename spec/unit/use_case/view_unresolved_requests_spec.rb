# frozen_string_literal: true

describe UseCase::ViewRequests do
  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_unresolved_requests) { described_class.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_unresolved_requests.execute }

  it 'can show client as the first key for the data' do
    VCR.use_cassette('response') do
      expect(response[1]).to eq([
        "18/07/2019 10:22:11",
        "daniel@madetech.com",
        "Daniel Williams",
        "Google",
        "Super Top Secret",
        "4 years",
        "The Moon",
        "10/10/10",
        "45",
        "Welding",
        "Very senior",
        "",
        "s",
        "TRUE",
        "FALSE",
        "This is what I've decided to do."
      ])
    end
  end
end
