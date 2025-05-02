defmodule UspsEx.InternationalPrices.RateDetails do
  @moduledoc """
  Provides struct and type for a RateDetails
  """

  @type t :: %__MODULE__{
          SKU: String.t() | nil,
          description: String.t() | nil,
          destinationEntryFacilityType: String.t() | nil,
          dimWeight: number | nil,
          endDate: Date.t() | nil,
          fees: [UspsEx.InternationalPrices.RateDetailsFees.t()] | nil,
          mailClass: String.t() | nil,
          price: number | nil,
          priceType: String.t() | nil,
          processingCategory: String.t() | nil,
          rateIndicator: String.t() | nil,
          startDate: Date.t() | nil,
          weight: number | nil,
          zone: String.t() | nil
        }

  defstruct [
    :SKU,
    :description,
    :destinationEntryFacilityType,
    :dimWeight,
    :endDate,
    :fees,
    :mailClass,
    :price,
    :priceType,
    :processingCategory,
    :rateIndicator,
    :startDate,
    :weight,
    :zone
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      SKU: {:string, :generic},
      description: {:string, :generic},
      destinationEntryFacilityType: {:enum, ["NONE", "INTERNATIONAL_SERVICE_CENTER"]},
      dimWeight: :number,
      endDate: {:string, :date},
      fees: [{UspsEx.InternationalPrices.RateDetailsFees, :t}],
      mailClass: {:string, :generic},
      price: :number,
      priceType:
        {:enum, ["RETAIL", "COMMERCIAL", "COMMERCIAL_BASE", "COMMERCIAL_PLUS", "CONTRACT"]},
      processingCategory:
        {:enum,
         [
           "CARDS",
           "LETTERS",
           "FLATS",
           "MACHINABLE",
           "IRREGULAR",
           "NON_MACHINABLE",
           "NONSTANDARD",
           "CATALOGS",
           "OPEN_AND_DISTRIBUTE",
           "RETURNS",
           "SOFT_PACK_MACHINABLE",
           "SOFT_PACK_NON_MACHINABLE"
         ]},
      rateIndicator: {:string, :generic},
      startDate: {:string, :date},
      weight: :number,
      zone: {:string, :generic}
    ]
  end
end
