defmodule UspsEx.DomesticPrices.ExtraServiceRateQueryWithSingleExtraService do
  @moduledoc """
  Provides struct and type for a ExtraServiceRateQueryWithSingleExtraService
  """

  @type t :: %__MODULE__{
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          destinationZIPCode: String.t() | nil,
          extraServices:
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
            | nil,
          itemValue: number | nil,
          mailClass: String.t(),
          mailingDate: Date.t() | nil,
          originZIPCode: String.t() | nil,
          priceType: String.t(),
          weight: number | nil
        }

  defstruct [
    :accountNumber,
    :accountType,
    :destinationZIPCode,
    :extraServices,
    :itemValue,
    :mailClass,
    :mailingDate,
    :originZIPCode,
    :priceType,
    :weight
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accountNumber: {:string, :generic},
      accountType: {:enum, ["EPS", "PERMIT", "METER"]},
      destinationZIPCode: {:string, :generic},
      extraServices:
        {:enum,
         [
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
         ]},
      itemValue: :number,
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
      weight: :number
    ]
  end
end
