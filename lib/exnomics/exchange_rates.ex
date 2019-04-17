defmodule Exnomics.ExchangeRates do
  @moduledoc """
  Functions for all market endpoints.
  """
  use Tesla
  alias Exnomics.ExchangeRate

  @doc """
  The exchange rates endpoint returns the current exchange rates used by Nomics to convert prices from markets into USD. This contains Fiat currencies as well as a BTC and ETH quote prices. This endpoint helps normalize data across markets as well as to provide localization for users.  Currently, this endpoint does not support historical data, but this feature is planned.

  ## Parameters

  - client(): Tesla.Env.client

  ## Returns

  {:ok, [%ExchangeRate{}, ...]} on success
  {:error, info} on failure
  """
  @spec get_exchange_rates(Tesla.Env.client(), keyword()) ::
          {:ok, list(ExchangeRate.t())} | {:error, Tesla.Env.t()}
  def get_exchange_rates(client, _opts \\ []) do
    get(client, "/exchange-rates")
  end
end
