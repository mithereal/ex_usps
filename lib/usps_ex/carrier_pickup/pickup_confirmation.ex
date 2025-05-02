defmodule UspsEx.CarrierPickup.PickupConfirmation do
  @moduledoc """
  Provides struct and type for a PickupConfirmation
  """

  @type t :: %__MODULE__{
          carrierPickupRequest: UspsEx.CarrierPickup.SchedulePickupRequest.t() | nil,
          confirmationNumber: String.t() | nil,
          pickupDate: Date.t() | nil
        }

  defstruct [:carrierPickupRequest, :confirmationNumber, :pickupDate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      carrierPickupRequest: {UspsEx.CarrierPickup.SchedulePickupRequest, :t},
      confirmationNumber: {:string, :generic},
      pickupDate: {:string, :date}
    ]
  end
end
