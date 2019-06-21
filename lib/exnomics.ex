defmodule Exnomics do
  @moduledoc """
  Exnomics API client built using Tesla
  """
  alias Exnomics.{Ohlcvs, Markets, Currencies}

  defdelegate get_markets(client, opts), to: Markets
  defdelegate get_markets(client), to: Markets

  defdelegate get_tickers(client), to: Currencies

  defdelegate get_exchange_candles(client, interval, exchange, market, opts), to: Ohlcvs

  defdelegate get_ohlcvs(client, interval, exchange, market, opts),
    to: Ohlcvs,
    as: :get_exchange_candles

  defdelegate get_ohlcvs(client, interval, exchange, market),
    to: Ohlcvs,
    as: :get_exchange_candles

  defdelegate get_aggregated_ohlcvs(client, interval, currency, opts),
    to: Ohlcvs,
    as: :get_aggregated_candles

  defdelegate get_aggregated_ohlcvs(client, interval, currency),
    to: Ohlcvs,
    as: :get_aggregated_candles

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

  def markets(opts \\ []) do
    get_markets(new(), opts)
  end

  def tickers!() do
    new()
    |> get_tickers()
    |> unwrap()
  end

  def ohlcvs!(interval, exchange, market, opts \\ []) do
    new()
    |> get_ohlcvs(interval, exchange, market, opts)
    |> unwrap()
  end

  defp unwrap({:ok, %{body: body}}) do
    body
  end

  defp unwrap({:error, err}) do
    raise(err)
  end
end
