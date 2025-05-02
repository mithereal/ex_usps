defmodule UspsEx.DomesticPrices.TotalRatesQueryResult do
  @moduledoc """
  Provides struct and type for a TotalRatesQueryResult
  """

  @type t :: %__MODULE__{
          rateOptions: [UspsEx.DomesticPrices.TotalRatesQueryResultRateOptions.t()] | nil
        }

  defstruct [:rateOptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rateOptions: [{UspsEx.DomesticPrices.TotalRatesQueryResultRateOptions, :t}]]
  end
end
