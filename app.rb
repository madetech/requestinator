# frozen_string_literal: true

require 'date'
require 'dotenv/load'
require 'sinatra'
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/lib/")
loader.enable_reloading
loader.setup

before { loader.reload }

use Rack::Auth::Basic, "Protected Area" do |username, password|
  username == ENV['USERNAME'] && password == ENV['PASSWORD']
end

get '/' do
  gateway = Sinatra::Application.environment == :development ? GoogleSheetsSimulator.new : Gateway::GoogleSpreadsheet.new

  response = UseCase::ViewRequests.new(
    google_spreadsheet_gateway: gateway
  ).execute

  response_summary = UseCase::ViewRequestsSummary.new(
    google_spreadsheet_gateway: gateway
  ).execute

  erb :index, locals: { data: response, summary_data: response_summary}
end

get '/resolved_requests' do
  gateway = Sinatra::Application.environment == :development ? GoogleSheetsSimulator.new : Gateway::GoogleSpreadsheet.new

  response = UseCase::ViewResolvedRequests.new(
    google_spreadsheet_gateway: gateway
  ).execute

  response_summary = UseCase::ViewRequestsSummary.new(
    google_spreadsheet_gateway: gateway
  ).execute

  erb :resolved_requests, locals: { data: response, summary_data: response_summary}
end
