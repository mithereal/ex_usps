defmodule UspsEx.DomesticPrices.TotalRatesQuery do
  @moduledoc """
  Provides struct and type for a TotalRatesQuery
  """

  @type t :: %__MODULE__{
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          destinationZIPCode: String.t() | nil,
          extraServices:
            [
              415
              | 480
              | 481
              | 482
              | 483
              | 484
              | 485
              | 486
              | 487
              | 488
              | 489
              | 498
              | 500
              | 501
              | 502
              | 810
              | 811
              | 812
              | 813
              | 814
              | 815
              | 816
              | 817
              | 818
              | 819
              | 820
              | 821
              | 822
              | 823
              | 824
              | 825
              | 826
              | 827
              | 828
              | 829
              | 830
              | 831
              | 832
              | 853
              | 856
              | 857
              | 858
              | 910
              | 911
              | 912
              | 913
              | 915
              | 917
              | 920
              | 921
              | 922
              | 923
              | 924
              | 925
              | 930
              | 931
              | 934
              | 940
              | 941
              | 955
              | 957
              | 972
              | 981
              | 984
              | 986
              | 991
            ]
            | nil,
          height: number | nil,
          itemValue: number | nil,
          length: number | nil,
          mailClass: String.t() | nil,
          mailClasses: [String.t()] | nil,
          mailingDate: Date.t() | nil,
          originZIPCode: String.t() | nil,
          priceType: String.t() | nil,
          weight: number | nil,
          width: number | nil
        }

  defstruct [
    :accountNumber,
    :accountType,
    :destinationZIPCode,
    :extraServices,
    :height,
    :itemValue,
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
      extraServices: [
        enum: [
          415,
          480,
          481,
          482,
          483,
          484,
          485,
          486,
          487,
          488,
          489,
          498,
          500,
          501,
          502,
          810,
          811,
          812,
          813,
          814,
          815,
          816,
          817,
          818,
          819,
          820,
          821,
          822,
          823,
          824,
          825,
          826,
          827,
          828,
          829,
          830,
          831,
          832,
          853,
          856,
          857,
          858,
          910,
          911,
          912,
          913,
          915,
          917,
          920,
          921,
          922,
          923,
          924,
          925,
          930,
          931,
          934,
          940,
          941,
          955,
          957,
          972,
          981,
          984,
          986,
          991
        ]
      ],
      height: :number,
      itemValue: :number,
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
