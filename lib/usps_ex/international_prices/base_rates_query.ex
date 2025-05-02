defmodule UspsEx.InternationalPrices.BaseRatesQuery do
  @moduledoc """
  Provides struct and type for a BaseRatesQuery
  """

  @type t :: %__MODULE__{
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          destinationCountryCode: String.t(),
          destinationEntryFacilityType: String.t(),
          foreignPostalCode: String.t() | nil,
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
    :destinationCountryCode,
    :destinationEntryFacilityType,
    :foreignPostalCode,
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
      accountType: {:enum, ["EPS", "PERMIT", "METER"]},
      destinationCountryCode: {:string, :generic},
      destinationEntryFacilityType: {:enum, ["NONE", "INTERNATIONAL_SERVICE_CENTER"]},
      foreignPostalCode: {:string, :generic},
      height: :number,
      length: :number,
      mailClass:
        {:enum,
         [
           "FIRST-CLASS_PACKAGE_INTERNATIONAL_SERVICE",
           "PRIORITY_MAIL_INTERNATIONAL",
           "PRIORITY_MAIL_EXPRESS_INTERNATIONAL",
           "GLOBAL_EXPRESS_GUARANTEED"
         ]},
      mailingDate: {:string, :date},
      originZIPCode: {:string, :generic},
      priceType:
        {:enum, ["RETAIL", "COMMERCIAL", "COMMERCIAL_BASE", "COMMERCIAL_PLUS", "CONTRACT"]},
      processingCategory: {:enum, ["FLATS", "MACHINABLE", "NON_MACHINABLE", "NONSTANDARD"]},
      rateIndicator:
        {:enum,
         [
           "E4",
           "E6",
           "E7",
           "FA",
           "FB",
           "FE",
           "FP",
           "FS",
           "PA",
           "PL",
           "SP",
           "EP",
           "HA",
           "HB",
           "HE",
           "HL",
           "HP",
           "HS",
           "LE"
         ]},
      weight: :number,
      width: :number
    ]
  end
end
