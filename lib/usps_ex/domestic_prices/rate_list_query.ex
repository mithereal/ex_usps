defmodule UspsEx.DomesticPrices.RateListQuery do
  @moduledoc """
  Provides struct and type for a RateListQuery
  """

  @type t :: %__MODULE__{
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          destinationZIPCode: String.t(),
          height: number,
          length: number,
          mailClass: String.t() | nil,
          mailClasses: [String.t()] | nil,
          mailingDate: Date.t() | nil,
          originZIPCode: String.t(),
          priceType: String.t() | nil,
          weight: number,
          width: number
        }

  defstruct [
    :accountNumber,
    :accountType,
    :destinationZIPCode,
    :height,
    :length,
    :mailClass,
    :mailClasses,
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
           "USPS_RETAIL_GROUND",
           "ALL"
         ]},
      mailClasses: [
        enum: [
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
          "USPS_RETAIL_GROUND",
          "ALL"
        ]
      ],
      mailingDate: {:string, :date},
      originZIPCode: {:string, :generic},
      priceType: {:enum, ["RETAIL", "COMMERCIAL", "CONTRACT", "NSA"]},
      weight: :number,
      width: :number
    ]
  end
end
