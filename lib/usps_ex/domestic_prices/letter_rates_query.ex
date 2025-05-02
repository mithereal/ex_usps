defmodule UspsEx.DomesticPrices.LetterRatesQuery do
  @moduledoc """
  Provides struct and type for a LetterRatesQuery
  """

  @type t :: %__MODULE__{
          extraServices: [910 | 911 | 930 | 931 | 934 | 940 | 941 | 955 | 957 | 985] | nil,
          height: number,
          itemValue: number | nil,
          length: number,
          mailingDate: Date.t() | nil,
          nonMachinableIndicators:
            UspsEx.DomesticPrices.LetterRatesQueryNonMachinableIndicators.t() | nil,
          processingCategory: String.t(),
          thickness: number,
          weight: number
        }

  defstruct [
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
      extraServices: [enum: [910, 911, 930, 931, 934, 940, 941, 955, 957, 985]],
      height: :number,
      itemValue: :number,
      length: :number,
      mailingDate: {:string, :date},
      nonMachinableIndicators:
        {UspsEx.DomesticPrices.LetterRatesQueryNonMachinableIndicators, :t},
      processingCategory: {:enum, ["LETTERS", "FLATS", "CARDS"]},
      thickness: :number,
      weight: :number
    ]
  end
end
