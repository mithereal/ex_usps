defmodule UspsEx.DomesticPrices.TotalRatesQueryResultRateOptions do
  @moduledoc """
  Provides struct and type for a TotalRatesQueryResultRateOptions
  """

  @type t :: %__MODULE__{
          extraServices: [UspsEx.DomesticPrices.TotalRatesExtraServiceRateDetails.t()] | nil,
          rates: [UspsEx.DomesticPrices.RateDetails.t()] | nil,
          totalBasePrice: number | nil,
          totalPrice: number | nil
        }

  defstruct [:extraServices, :rates, :totalBasePrice, :totalPrice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      extraServices: [{UspsEx.DomesticPrices.TotalRatesExtraServiceRateDetails, :t}],
      rates: [{UspsEx.DomesticPrices.RateDetails, :t}],
      totalBasePrice: :number,
      totalPrice: :number
    ]
  end
end
