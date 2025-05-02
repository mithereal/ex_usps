defmodule UspsEx.InternationalPrices.InternationalRateListQuery do
  @moduledoc """
  Provides struct and type for a InternationalRateListQuery
  """

  @type t :: %__MODULE__{
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          destinationCountryCode: String.t(),
          foreignPostalCode: String.t() | nil,
          height: number,
          length: number,
          mailClass: String.t() | nil,
          mailingDate: Date.t() | nil,
          originZIPCode: String.t(),
          priceType: String.t() | nil,
          weight: number,
          width: number
        }

  defstruct [
    :accountNumber,
    :accountType,
    :destinationCountryCode,
    :foreignPostalCode,
    :height,
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
      foreignPostalCode: {:string, :generic},
      height: :number,
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
