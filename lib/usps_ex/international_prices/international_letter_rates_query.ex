defmodule UspsEx.InternationalPrices.InternationalLetterRatesQuery do
  @moduledoc """
  Provides struct and type for a InternationalLetterRatesQuery
  """

  @type t :: %__MODULE__{
          destinationCountryCode: String.t(),
          extraServices: [940 | 955] | nil,
          height: number,
          itemValue: number | nil,
          length: number,
          mailingDate: Date.t() | nil,
          nonMachinableIndicators:
            UspsEx.InternationalPrices.InternationalLetterRatesQueryNonMachinableIndicators.t()
            | nil,
          processingCategory: String.t(),
          thickness: number,
          weight: number
        }

  defstruct [
    :destinationCountryCode,
    :extraServices,
    :height,
    :itemValue,
    :length,
    :mailingDate,
    :nonMachinableIndicators,
    :processingCategory,
    :thickness,
    :weight
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      destinationCountryCode: {:string, :generic},
      extraServices: [enum: [940, 955]],
      height: :number,
      itemValue: :number,
      length: :number,
      mailingDate: {:string, :date},
      nonMachinableIndicators:
        {UspsEx.InternationalPrices.InternationalLetterRatesQueryNonMachinableIndicators, :t},
      processingCategory: {:enum, ["LETTERS", "FLATS", "CARDS"]},
      thickness: :number,
      weight: :number
    ]
  end
end
