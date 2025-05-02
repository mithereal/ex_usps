defmodule UspsEx.InternationalPrices.ExtraServiceRateQuery do
  @moduledoc """
  Provides struct and type for a ExtraServiceRateQuery
  """

  @type t :: %__MODULE__{
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          destinationCountryCode: String.t(),
          extraService: 813 | 820 | 826 | 857 | 930 | 931 | 955 | nil,
          extraServices: [813 | 820 | 826 | 857 | 930 | 931 | 955] | nil,
          itemValue: String.t() | nil,
          mailClass: String.t(),
          mailingDate: Date.t() | nil,
          priceType: String.t(),
          rateIndicator: String.t(),
          weight: number
        }

  defstruct [
    :accountNumber,
    :accountType,
    :destinationCountryCode,
    :extraService,
    :extraServices,
    :itemValue,
    :mailClass,
    :mailingDate,
    :priceType,
    :rateIndicator,
    :weight
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accountNumber: {:string, :generic},
      accountType: {:enum, ["EPS", "PERMIT", "METER"]},
      destinationCountryCode: {:string, :generic},
      extraService: {:enum, [813, 820, 826, 857, 930, 931, 955]},
      extraServices: [enum: [813, 820, 826, 857, 930, 931, 955]],
      itemValue: {:string, :generic},
      mailClass:
        {:enum,
         [
           "FIRST-CLASS_PACKAGE_INTERNATIONAL_SERVICE",
           "PRIORITY_MAIL_INTERNATIONAL",
           "PRIORITY_MAIL_EXPRESS_INTERNATIONAL",
           "GLOBAL_EXPRESS_GUARANTEED"
         ]},
      mailingDate: {:string, :date},
      priceType: {:enum, ["RETAIL", "COMMERCIAL", "COMMERCIAL_PLUS", "NSA"]},
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
      weight: :number
    ]
  end
end
