defmodule UspsEx.InternationalPrices.TotalRatesQueryResultRateOptions do
  @moduledoc """
  Provides struct and type for a TotalRatesQueryResultRateOptions
  """

  @type t :: %__MODULE__{
          extraServices: [[UspsEx.InternationalPrices.ExtraServiceRateDetailsInner.t()]] | nil,
          rates: [UspsEx.InternationalPrices.RateDetails.t()] | nil,
          totalBasePrice: number | nil,
          totalPrice: number | nil
        }

  defstruct [:extraServices, :rates, :totalBasePrice, :totalPrice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      extraServices: [[{UspsEx.InternationalPrices.ExtraServiceRateDetailsInner, :t}]],
      rates: [{UspsEx.InternationalPrices.RateDetails, :t}],
      totalBasePrice: :number,
      totalPrice: :number
    ]
  end
end
