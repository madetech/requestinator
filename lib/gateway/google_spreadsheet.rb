require 'google/apis/sheets_v4'
require 'googleauth'

class Gateway::GoogleSpreadsheet
  def all
    service = Google::Apis::SheetsV4::SheetsService.new
    service.client_options.application_name = 'Some application name'
    service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS
    )
    spreadsheet_id = '10p_Ww97jxLR0LE3KkgxsA_7KbtkZBdFFCeCAu2hwkGo'
    range = 'request_responses!A1:P'

    response = service.get_spreadsheet_values(spreadsheet_id, range)

    response.values.drop(1)
  end
end
