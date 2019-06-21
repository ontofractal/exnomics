defmodule ExnomicsTest do
  use ExUnit.Case
  alias Exnomics.Ohlcv
  import Exnomics
  doctest Exnomics

  describe "Exnomics" do
    test "tickers!()" do
      assert %{name: name, "1d": %{}} = hd(tickers!())
    end

    test "ohlcvs!()" do
      assert %Ohlcv{close: _, high: _, timestamp: _} = hd(ohlcvs!("1d", "binance", "BTCUSDT"))
    end
  end
end
