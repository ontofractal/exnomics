defmodule ExnomicsTest do
  use ExUnit.Case
  import Exnomics
  doctest Exnomics

  describe "Exnomics" do
    test "tickers!()" do
      assert %{name: name, "1d": %{}} = hd(tickers!())
    end
  end
end
