# frozen_string_literal: true

class UseCase::ViewRequests
  def initialize(google_spreadsheet_gateway:)
    @google_spreadsheet_gateway = google_spreadsheet_gateway
  end

  def execute
    condensed_data = []
    @google_spreadsheet_gateway.all.each do |row|
      if row[0] != "" && row[14] == "FALSE"
        condensed_data << row
      end
    end
    pp condensed_data
  end
end
