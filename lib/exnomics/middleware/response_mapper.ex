defmodule Exnomics.ResponseMapper do
  @behaviour Tesla.Middleware
  alias Exnomics.{Market, Ohlcv, ExchangeRate}

  @moduledoc """
  Parses and maps API responses to corresponding structs using idiomatic underscored atom keys, etc.
  """

  def call(env, next, _options) do
    env
    |> Tesla.run(next)
    |> handle_response()
  end

  def handle_response(response) do
    with {:ok, env} <- response do
      url = env.url

      builder =
        cond do
          url =~ ~r|/markets$| ->
            &struct!(Market, &1)

          url =~ ~r|/exchange_candles$| or url =~ ~r|/candles$| ->
            &struct!(Ohlcv, &1)

          url =~ ~r|/exchange-rates$| ->
            &struct!(ExchangeRate, &1)

          url =~ ~r|/prices$| ->
            & &1

          url =~ ~r|/currencies/.+$| ->
            & &1

          true ->
            {:error, "Response mapper middleware has no builder for this request url: #{env.url}"}
        end

      builder_mapper = &(MapKeys.to_atoms_unsafe!(&1) |> Enum.map(builder))
      env = update_in(env.body, builder_mapper)
      {:ok, env}
    else
      err -> err
    end
  end
end
