# frozen_string_literal: true

describe UseCase::ViewResolvedRequests do
  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_resolved_requests) { described_class.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_resolved_requests.execute }

  it 'can show client as the first key for the data' do
      expect(response[0]).to eq(["10/07/2019 10:48:36",
        "maysa@madetech.com",
        "Maysa",
        "Made Tech",
        "Requestinator",
        "2 weeks", "London Bridge", "10/10/10", "1", "Ruby", "Software Engineer",
        "Project is bulfing stuff", "TRUE", "TRUE", "Yes all good!"])
  end
end
