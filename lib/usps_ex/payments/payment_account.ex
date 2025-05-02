defmodule UspsEx.Payments.PaymentAccount do
  @moduledoc """
  Provides struct and type for a PaymentAccount
  """

  @type t :: %__MODULE__{
          accountNumber: String.t() | nil,
          accountType: String.t() | nil,
          nonProfitStatus: boolean | nil,
          permitNumber: String.t() | nil,
          permitZIP: String.t() | nil,
          sufficientFunds: boolean | nil
        }

  defstruct [
    :accountNumber,
    :accountType,
    :nonProfitStatus,
    :permitNumber,
    :permitZIP,
    :sufficientFunds
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accountNumber: {:string, :generic},
      accountType: {:enum, ["EPS", "PERMIT", "METER"]},
      nonProfitStatus: :boolean,
      permitNumber: {:string, :generic},
      permitZIP: {:string, :generic},
      sufficientFunds: :boolean
    ]
  end
end
