defmodule Exnomics.OhlcvTest do
  use ExUnit.Case
  import Exnomics.Ohlcvs
  alias Exnomics.Ohlcv
  doctest Exnomics
  @client Exnomics.new()

  test "get ohlcvs/candles" do
    assert {:ok, %{body: ohlcvs = [%Ohlcv{} | _]}} =
             get_exchange_candles(
               @client,
               "1d",
               "binance",
               "BTCUSDT",
               start: "2018-03-14T00-00-00Z",
               end: "2018-04-14T00-00-00Z"
             )

    assert length(ohlcvs) == 31
  end

  test "defdelegate get ohlcvs/candles" do
    assert {:ok, %{body: [%Ohlcv{} | _]}} =
             Exnomics.get_ohlcvs(
               @client,
               "1d",
               "binance",
               "BTCUSDT",
               start: "2018-04-14T00-00-00Z",
               end: "2018-05-14T00-00-00Z"
             )
  end
end
