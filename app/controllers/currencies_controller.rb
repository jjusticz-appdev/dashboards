class CurrenciesController < ApplicationController

  def first_currency
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @currencies = @parsed_data.fetch("symbols").keys

    render({:template => "layouts/step_one.html.erb"})

  end

  def convert
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @currencies = @parsed_data.fetch("symbols").keys
    @from_cur = params.fetch("from_currency")
    #@convert_data = open("https://api.exchangerate.host/convert?from=#{@cur}&to=#{@symbol}")

    render({:template => "layouts/step_two.html.erb"})

  end

end
