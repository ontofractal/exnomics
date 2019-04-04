defmodule Exnomics do
  @moduledoc """
  Exnomics API client built using Tesla
  """
  defdelegate get_markets(client, opts), to: Exnomics.Markets

  defdelegate get_exchange_candles(client, interval, exchange, market, opts), to: Exnomics.Ohlcvs

  defdelegate get_ohlcvs(client, interval, exchange, market, opts),
    to: Exnomics.Ohlcvs,
    as: :get_exchange_candles

  defdelegate get_ohlcvs(client, interval, exchange, market),
    to: Exnomics.Ohlcvs,
    as: :get_exchange_candles

  @base_url "https://api.nomics.com/v1"

  use Tesla

  @doc """
  Configure a client connection

  # Returns

  Tesla.Env.client
  """
  @spec new() :: Tesla.Env.client()
  def new do
    api_key = Application.get_env(:exnomics, :api_key)

    Tesla.client([
      {Tesla.Middleware.BaseUrl, @base_url},
      {Tesla.Middleware.Query, [key: api_key]},
      {Exnomics.ResponseMapper, []},
      {Tesla.Middleware.JSON, []}
    ])
  end
end
