defmodule Exnomics.Market do
  @moduledoc """
  A market struct.
  """

  use TypedStruct

  @typedoc "A person"
  typedstruct do
    field :exchange, String.t(), enforce: true
    field :market, String.t(), enforce: true
    field :base, String.t(), enforce: true
    field :quote, String.t(), enforce: true
  end
end
