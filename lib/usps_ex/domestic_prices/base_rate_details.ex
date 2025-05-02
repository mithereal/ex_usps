defmodule UspsEx.DomesticPrices.BaseRateDetails do
  @moduledoc """
  Provides struct and type for a BaseRateDetails
  """

  @type t :: %__MODULE__{
          SKU: String.t() | nil,
          description: String.t() | nil,
          destinationEntryFacilityType: String.t() | nil,
          dimWeight: number | nil,
          endDate: Date.t() | nil,
          fees: [map] | nil,
          mailClass: String.t() | nil,
          price: number | nil,
          priceType: String.t() | nil,
          processingCategory: String.t() | nil,
          productDefinition: String.t() | nil,
          productName: String.t() | nil,
          rateIndicator: String.t() | nil,
          startDate: Date.t() | nil,
          warnings: [String.t()] | nil,
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
    :productDefinition,
    :productName,
    :rateIndicator,
    :startDate,
    :warnings,
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
      destinationEntryFacilityType:
        {:enum,
         [
           "NONE",
           "AREA_DISTRIBUTION_CENTER",
           "AUXILIARY_SERVICE_FACILITY",
           "DESTINATION_DELIVERY_UNIT",
           "DESTINATION_NETWORK_DISTRIBUTION_CENTER",
           "DESTINATION_SECTIONAL_CENTER_FACILITY",
           "DESTINATION_SERVICE_HUB"
         ]},
      dimWeight: :number,
      endDate: {:string, :date},
      fees: [:map],
      mailClass: {:string, :generic},
      price: :number,
      priceType:
        {:enum, ["RETAIL", "COMMERCIAL", "COMMERCIAL_BASE", "COMMERCIAL_PLUS", "CONTRACT", "NSA"]},
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
      productDefinition: {:string, :generic},
      productName: {:string, :generic},
      rateIndicator: {:string, :generic},
      startDate: {:string, :date},
      warnings: [string: :generic],
      weight: :number,
      zone: {:string, :generic}
    ]
  end
end
