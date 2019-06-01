defmodule Exnomics.OhlcvTest do
  use ExUnit.Case, async: true
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

    assert {:ok, %{body: _ = [%Ohlcv{} | _]}} =
             get_exchange_candles(
               @client,
               "1d",
               "binance",
               "BTCUSDT"
             )

    assert length(ohlcvs) == 31
  end

  test "get aggregated ohlcvs/candles" do
    assert {:ok, %{body: ohlcvs = [%Ohlcv{} | _]}} =
             get_aggregated_candles(
               @client,
               "1d",
               "BTC",
               start: ~N[2018-04-14 00:00:00],
               end: ~N[2018-05-14 00:00:00]
             )

    assert {:ok, %{body: _ = [%Ohlcv{} | _]}} =
             get_aggregated_candles(
               @client,
               "1d",
               "BTC"
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
