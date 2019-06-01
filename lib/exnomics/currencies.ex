defmodule Exnomics.Currencies do
  @moduledoc """
  API calls for all endpoints tagged `candles`.
  """
  use Tesla, only: [:get], docs: false

  @spec get_prices(Tesla.Client.t()) :: {:error, any} | {:ok, Tesla.Env.t()}
  def get_prices(client) do
    get(client, "/prices")
  end

  @spec get_tickers(Tesla.Client.t()) :: {:error, any} | {:ok, Tesla.Env.t()}
  def get_tickers(client) do
    get(client, "/currencies/ticker")
  end
end
