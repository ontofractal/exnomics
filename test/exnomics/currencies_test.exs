defmodule Exnomics.CurrenciesTest do
  use ExUnit.Case, async: true
  import Exnomics.Currencies
  doctest Exnomics
  @client Exnomics.new()

  @tag :skip
  test "get prices" do
    {:ok, %{body: body}} = get_prices(@client)
    assert body === []
  end

  test "get_ticker/1" do
    {:ok, %{body: body}} = get_tickers(@client)
    assert hd(body) === %{}
    assert body === []
  end
end
