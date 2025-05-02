defmodule UspsEx.CarrierPickup.SchedulePickupRequest do
  @moduledoc """
  Provides struct and type for a SchedulePickupRequest
  """

  @type t :: %__MODULE__{
          estimatedWeight: number,
          packages: [UspsEx.CarrierPickup.SchedulePickupRequestPackages.t()],
          pickupAddress: UspsEx.CarrierPickup.PickupAddress.t(),
          pickupDate: Date.t(),
          pickupLocation: UspsEx.CarrierPickup.SchedulePickupRequestPickupLocation.t()
        }

  defstruct [:estimatedWeight, :packages, :pickupAddress, :pickupDate, :pickupLocation]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      estimatedWeight: :number,
      packages: [{UspsEx.CarrierPickup.SchedulePickupRequestPackages, :t}],
      pickupAddress: {UspsEx.CarrierPickup.PickupAddress, :t},
      pickupDate: {:string, :date},
      pickupLocation: {UspsEx.CarrierPickup.SchedulePickupRequestPickupLocation, :t}
    ]
  end
end
