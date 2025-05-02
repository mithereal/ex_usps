defmodule UspsEx.CarrierPickup.PickupAddress do
  @moduledoc """
  Provides struct and type for a PickupAddress
  """

  @type t :: %__MODULE__{
          address: UspsEx.CarrierPickup.DomesticAddress.t() | nil,
          contact: [UspsEx.CarrierPickup.EmailNotification.t() | UspsEx.CarrierPickup.SMSNotification.t()],
          firm: String.t() | nil,
          firstName: String.t() | nil,
          lastName: String.t() | nil
        }

  defstruct [:address, :contact, :firm, :firstName, :lastName]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      address: {UspsEx.CarrierPickup.DomesticAddress, :t},
      contact: [union: [{UspsEx.CarrierPickup.EmailNotification, :t}, {UspsEx.CarrierPickup.SMSNotification, :t}]],
      firm: {:string, :generic},
      firstName: {:string, :generic},
      lastName: {:string, :generic}
    ]
  end
end
