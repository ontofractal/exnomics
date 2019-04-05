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
               start: ~N[2018-04-14 00:00:00],
               end: ~N[2018-05-14 00:00:00]
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
               start: ~N[2018-04-14 00:00:00],
               end: ~N[2018-05-14 00:00:00]
             )
  end
end
