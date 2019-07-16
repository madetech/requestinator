# frozen_string_literal: true

class UseCase::ViewRequests
  def initialize(google_spreadsheet_gateway:)
    @google_spreadsheet_gateway = google_spreadsheet_gateway
  end

  def execute
    @google_spreadsheet_gateway.all.each do |row|
      if(row[0] != "")
        row
      end
    end
  end
end
