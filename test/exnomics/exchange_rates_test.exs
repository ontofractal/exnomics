defmodule Exnomics.ExchangeRatesTest do
  use ExUnit.Case
  import Exnomics.ExchangeRates
  alias Exnomics.ExchangeRate
  @client Exnomics.new()

  test "get exchange rates" do
    assert {:ok, %{body: [%ExchangeRate{} | _]}} = get_exchange_rates(@client)
  end
end
