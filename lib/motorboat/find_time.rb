require 'faraday'
require 'json'
require 'active_support/all'

module Motorboat
  class FindTime
    DA_TIMES = 'https://fareharbor.com/api/v1/companies/dillonmarina/items/35715/calendar/2017/08/?allow_grouped=yes'
    THE_DAY = Time.parse('2017-08-19 00:00:00 -0600')
    DESIRED_STARTS = (THE_DAY.change(hour: 10))..(THE_DAY.change(hour: 14, min: 30))

    attr_reader :availabilities, :money_times

    def initialize
      times_json = Faraday.get(DA_TIMES).body
      times = JSON.parse(times_json, symbolize_names: true)
      availabilities = times[:calendar][:weeks][2][:days].detect { |day| day[:at] == '2017-08-19' }[:availabilities]
      money_times = availabilities.select do |a|
        starts_at = Time.parse(a[:utc_start_at])
        DESIRED_STARTS.cover?(starts_at)
      end

      @availabilities = availabilities
      @money_times = money_times
    end

    def money?
      money_times.count > 0
    end
  end
end
