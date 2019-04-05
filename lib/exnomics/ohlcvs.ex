defmodule Exnomics.Ohlcvs do
  @moduledoc """
  API calls for all endpoints tagged `candles`.
  """
  alias Exnomics.{Ohlcv, Utils}
  use Tesla

  @doc """
  Exchange OHLCV Candles
  The exchange candles endpoint returns raw open, close, high, low, and volume information for Nomics Markets.
  The data is not aggregated, therefore prices are in the quote currency of the market and volume is in the base currency of the market.

  * 1d: From inception updated every minute
  * 4h: Rolling 120 days updated every minute
  * 1h: Rolling 30 days updated every minute
  * 30m: Rolling 14 days updated every minute
  * 5m: Rolling 3 days updated every 10 seconds
  * 1m: Rolling 24 hours updated every 10 seconds

  ## Parameters

  - client (Exnomics Tesla Client): Connection to server
  - interval (String.t): Time interval of the candle
  - exchange (String.t): Exchange ID
  - market (String.t): The Exchange's Market ID from Markets
  - opts (KeywordList): Optional parameters
    - :start (String.t): Start time of the interval in RFC3339 (URI escaped). If not provided, starts from first candle.
    - :end (String.t): End time of the interval in RFC3339 (URI escaped). If not provided, the current time is used.

  ## Returns

  {:ok, [%Ohlcv{}, ...]} on success
  {:error, info} on failure
  """
  @spec get_exchange_candles(Tesla.Env.client(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, list(Ohlcv.t())} | {:error, Tesla.Env.t()}
  def get_exchange_candles(client, interval, exchange, market, opts \\ []) do
    query_kw =
      [interval: interval, exchange: exchange, market: market] ++
        Utils.maybe_parse_datetime_opts(opts)

    get(client, "/exchange_candles", query: query_kw)
  end
end
