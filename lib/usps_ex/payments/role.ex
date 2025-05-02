defmodule UspsEx.Payments.Role do
  @moduledoc """
  Provides struct and type for a Role
  """

  @type t :: %__MODULE__{
          CRID: String.t() | nil,
          MID: String.t() | nil,
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          manifestMID: String.t() | nil,
          nonProfitStatus: boolean | nil,
          permitNumber: String.t() | nil,
          permitZIP: String.t() | nil,
          roleName: String.t() | nil,
          sufficientFunds: boolean | nil
        }

  defstruct [
    :CRID,
    :MID,
    :accountNumber,
    :accountType,
    :manifestMID,
    :nonProfitStatus,
    :permitNumber,
    :permitZIP,
    :roleName,
    :sufficientFunds
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CRID: {:string, :generic},
      MID: {:string, :generic},
      accountNumber: {:string, :generic},
      accountType: {:enum, ["EPS", "PERMIT", "METER"]},
      manifestMID: {:string, :generic},
      nonProfitStatus: :boolean,
      permitNumber: {:string, :generic},
      permitZIP: {:string, :generic},
      roleName:
        {:enum,
         [
           "PAYER",
           "RATE_HOLDER",
           "LABEL_OWNER",
           "SHIPPER",
           "MAIL_OWNER",
           "PLATFORM",
           "RETURN_LABEL_PAYER",
           "RETURN_LABEL_RATE_HOLDER",
           "RETURN_LABEL_OWNER"
         ]},
      sufficientFunds: :boolean
    ]
  end
end
