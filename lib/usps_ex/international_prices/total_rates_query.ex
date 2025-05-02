defmodule UspsEx.InternationalPrices.TotalRatesQuery do
  @moduledoc """
  Provides struct and type for a TotalRatesQuery
  """

  @type t :: %__MODULE__{
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          destinationCountryCode: String.t() | nil,
          extraServices: [813 | 820 | 826 | 857 | 930 | 931 | 955] | nil,
          foreignPostalCode: String.t() | nil,
          height: number | nil,
          itemValue: number | nil,
          length: number | nil,
          mailClass: String.t() | nil,
          mailingDate: Date.t() | nil,
          originZIPCode: String.t() | nil,
          priceType: String.t() | nil,
          weight: number | nil,
          width: number | nil
        }

  defstruct [
    :accountNumber,
    :accountType,
    :destinationCountryCode,
    :extraServices,
    :foreignPostalCode,
    :height,
    :itemValue,
    :length,
    :mailClass,
    :mailingDate,
    :originZIPCode,
    :priceType,
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
      extraServices: [enum: [813, 820, 826, 857, 930, 931, 955]],
      foreignPostalCode: {:string, :generic},
      height: :number,
      itemValue: :number,
      length: :number,
      mailClass:
        {:enum,
         [
           "FIRST-CLASS_PACKAGE_INTERNATIONAL_SERVICE",
           "PRIORITY_MAIL_INTERNATIONAL",
           "PRIORITY_MAIL_EXPRESS_INTERNATIONAL",
           "GLOBAL_EXPRESS_GUARANTEED",
           "ALL"
         ]},
      mailingDate: {:string, :date},
      originZIPCode: {:string, :generic},
      priceType:
        {:enum, ["RETAIL", "COMMERCIAL", "COMMERCIAL_BASE", "COMMERCIAL_PLUS", "CONTRACT"]},
      weight: :number,
      width: :number
    ]
  end
end
