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

  def exchange
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @currencies = @parsed_data.fetch("symbols").keys
    @from_cur = params.fetch("from_currency")
    @to_cur = params.fetch("to_currency")
    @exchange_raw = open("https://api.exchangerate.host/convert?from=#{@from_cur}&to=#{@to_cur}").read
    @exchange_parsed = JSON.parse(@exchange_raw)
    @exchange_rate = @exchange_parsed.fetch("result")

    render({:template => "layouts/step_three.html.erb"})

  end

end
