
class UseCase::ViewRequestsSummary
  def initialize(google_spreadsheet_gateway:)
    @google_spreadsheet_gateway = google_spreadsheet_gateway
  end

  def execute
    condensed_data = {
      active:0,
      in_progress:0
    }
    @google_spreadsheet_gateway.all.each do |row|
      if row[0] != "" && row[13] == "FALSE"
        condensed_data[:active]+=1
      end
      if row[0] != "" && row[12] == "TRUE" && row[13] == "FALSE"
        condensed_data[:in_progress]+=1
      end
    end
    condensed_data
  end
end