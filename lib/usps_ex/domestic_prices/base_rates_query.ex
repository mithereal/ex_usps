defmodule UspsEx.DomesticPrices.BaseRatesQuery do
  @moduledoc """
  Provides struct and type for a BaseRatesQuery
  """

  @type t :: %__MODULE__{
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          destinationEntryFacilityType: String.t(),
          destinationZIPCode: String.t(),
          height: number,
          length: number,
          mailClass: String.t(),
          mailingDate: Date.t() | nil,
          originZIPCode: String.t(),
          priceType: String.t(),
          processingCategory: String.t(),
          rateIndicator: String.t(),
          weight: number,
          width: number
        }

  defstruct [
    :accountNumber,
    :accountType,
    :destinationEntryFacilityType,
    :destinationZIPCode,
    :height,
    :length,
    :mailClass,
    :mailingDate,
    :originZIPCode,
    :priceType,
    :processingCategory,
    :rateIndicator,
    :weight,
    :width
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accountNumber: {:string, :generic},
      accountType: {:enum, ["EPS", "PERMIT", "METER", "MID"]},
      destinationEntryFacilityType:
        {:enum,
         [
           "NONE",
           "DESTINATION_NETWORK_DISTRIBUTION_CENTER",
           "DESTINATION_SECTIONAL_CENTER_FACILITY",
           "DESTINATION_DELIVERY_UNIT",
           "DESTINATION_SERVICE_HUB"
         ]},
      destinationZIPCode: {:string, :generic},
      height: :number,
      length: :number,
      mailClass:
        {:enum,
         [
           "PARCEL_SELECT",
           "PARCEL_SELECT_LIGHTWEIGHT",
           "PRIORITY_MAIL_EXPRESS",
           "PRIORITY_MAIL",
           "FIRST-CLASS_PACKAGE_SERVICE",
           "LIBRARY_MAIL",
           "MEDIA_MAIL",
           "BOUND_PRINTED_MATTER",
           "USPS_CONNECT_LOCAL",
           "USPS_CONNECT_MAIL",
           "USPS_CONNECT_REGIONAL",
           "USPS_GROUND_ADVANTAGE",
           "USPS_GROUND_ADVANTAGE_RETURN_SERVICE",
           "USPS_RETAIL_GROUND",
           "GROUND_RETURN_SERVICE",
           "FIRST-CLASS_PACKAGE_RETURN_SERVICE",
           "PRIORITY_MAIL_RETURN_SERVICE",
           "PRIORITY_MAIL_EXPRESS_RETURN_SERVICE"
         ]},
      mailingDate: {:string, :date},
      originZIPCode: {:string, :generic},
      priceType: {:enum, ["RETAIL", "COMMERCIAL", "CONTRACT", "NSA"]},
      processingCategory:
        {:enum, ["LETTERS", "FLATS", "MACHINABLE", "IRREGULAR", "NON_MACHINABLE", "NONSTANDARD"]},
      rateIndicator:
        {:enum,
         [
           "3D",
           "3N",
           "3R",
           "5D",
           "BA",
           "BB",
           "BM",
           "C1",
           "C2",
           "C3",
           "C4",
           "C5",
           "CP",
           "CM",
           "DC",
           "DE",
           "DF",
           "DN",
           "DR",
           "E4",
           "E6",
           "E7",
           "FA",
           "FB",
           "FE",
           "FP",
           "FS",
           "LC",
           "LF",
           "LL",
           "LO",
           "LS",
           "NP",
           "O1",
           "O2",
           "O3",
           "O4",
           "O5",
           "O6",
           "O7",
           "OS",
           "P5",
           "P6",
           "P7",
           "P8",
           "P9",
           "Q6",
           "Q7",
           "Q8",
           "Q9",
           "Q0",
           "PA",
           "PL",
           "PM",
           "PR",
           "SB",
           "SN",
           "SP",
           "SR"
         ]},
      weight: :number,
      width: :number
    ]
  end
end
