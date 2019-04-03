defmodule Exnomics.Markets do
  @moduledoc """
  Functions for all market endpoints.
  """
  alias Exnomics.Market
  use Tesla

  @doc """
  The markets endpoint returns information on the exchanges and markets that Nomics supports, in addition to the Nomics currency identifiers for the base and quote currency.

  ## Parameters

  - connection (Exnomics Tesla client): Tesla client
  - opts (KeywordList): Optional parameters
    - :exchange (String.t): Nomics Exchange ID to filter by
    - :base (String.t): Comma separated list of base currencies to filter by
    - :quote (String.t): Comma separated list of quote currencies to filter by

  ## Returns

  {:ok, [%Market{}]} on success
  {:error, info} on failure
  """
  @spec get_markets(Tesla.Env.client(), keyword()) ::
          {:ok, list(Market.t())} | {:error, Tesla.Env.t()}
  def get_markets(client, opts \\ []) do
    get(client, "/markets", opts)
  end
end
