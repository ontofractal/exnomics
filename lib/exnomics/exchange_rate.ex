defmodule Exnomics.ExchangeRate do
  @moduledoc """
  An exchange rate struct.
  """

  use TypedStruct

  @typedoc "An exchange rate"

  typedstruct do
    field :currency, String.t(), enforce: true
    field :rate, float(), enforce: true
    field :timestamp, String.t, enforce: true
  end

end
