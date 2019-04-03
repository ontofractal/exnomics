defmodule Exnomics.MarketsTest do
  use ExUnit.Case
  import Exnomics.Markets
  alias Exnomics.Market
  doctest Exnomics
  @client Exnomics.new()

  test "get_markets" do
    assert {:ok, %{body: [%Market{} | _]}} = get_markets(@client)
  end

  test "get_markets with opts" do
    assert {:ok, %{body: [%Market{} | _]}} =
             get_markets(@client,
               exchange: "binance",
               base: "BTC,ETH,LTC,XMR",
               quote: "BTC,ETH,BNB"
             )
  end
end
