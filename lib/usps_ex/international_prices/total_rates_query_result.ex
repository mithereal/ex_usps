defmodule UspsEx.InternationalPrices.TotalRatesQueryResult do
  @moduledoc """
  Provides struct and type for a TotalRatesQueryResult
  """

  @type t :: %__MODULE__{
          rateOptions: [UspsEx.InternationalPrices.TotalRatesQueryResultRateOptions.t()] | nil
        }

  defstruct [:rateOptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rateOptions: [{UspsEx.InternationalPrices.TotalRatesQueryResultRateOptions, :t}]]
  end
end
