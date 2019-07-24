# frozen_string_literal: true

class UseCase::ViewResolvedRequests
  def initialize(google_spreadsheet_gateway:)
    @google_spreadsheet_gateway = google_spreadsheet_gateway
  end

  def execute
    resolved_requests = []
    @google_spreadsheet_gateway.all.each do |row|
      if row[0] != "" && row[14] == "TRUE"
        resolved_requests << row
      end
    end
    resolved_requests
  end
end
