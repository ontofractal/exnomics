defmodule Exnomics do
  @moduledoc """
  Exnomics API client built using Tesla
  """
  @api_key Application.get_env(:exnomics, :api_key)
  @base_url "https://api.nomics.com/v1"

  use Tesla

  @doc """
  Configure a client connection

  # Returns

  Tesla.Env.client
  """
  @spec new() :: Tesla.Env.client()
  def new do
    Tesla.client([
      {Tesla.Middleware.BaseUrl, @base_url},
      {Tesla.Middleware.Query, [key: @api_key]},
      {Exnomics.ResponseMapper, []},
      {Tesla.Middleware.JSON, []},
    ])
  end
end
