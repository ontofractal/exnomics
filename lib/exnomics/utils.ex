defmodule Exnomics.Utils do
  @keys [:start, :end]
  def maybe_parse_datetime_opts(opts) do
    Enum.reduce(@keys, [], fn key, acc ->
      acc ++
        if time = opts[key] do
          [{key, Timex.format!(time, "{RFC3339z}")}]
        else
          []
        end
    end)
  end
end
