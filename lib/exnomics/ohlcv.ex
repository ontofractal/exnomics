defmodule Exnomics.Ohlcv do
  @moduledoc """
  A candle|ohlcv struct.
  """

  use TypedStruct

  @typedoc "An ohlcv, also a candle"
  typedstruct do
    field :timestamp, String.t(), enforce: true
    field :low, float(), enforce: true
    field :open, float(), enforce: true
    field :close, float(), enforce: true
    field :high, float(), enforce: true
    field :volume, float(), enforce: true
    field :num_trades, integer(), enforce: true
  end
end
