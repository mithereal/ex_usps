defmodule UspsEx.CarrierPickup.SchedulePickupRequestPickupLocation do
  @moduledoc """
  Provides struct and type for a SchedulePickupRequestPickupLocation
  """

  @type t :: %__MODULE__{
          dogPresent: boolean | nil,
          packageLocation: String.t(),
          specialInstructions: String.t() | nil
        }

  defstruct [:dogPresent, :packageLocation, :specialInstructions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dogPresent: :boolean,
      packageLocation:
        {:enum,
         [
           "FRONT_DOOR",
           "BACK_DOOR",
           "SIDE_DOOR",
           "KNOCK_ON_DOOR",
           "MAIL_ROOM",
           "OFFICE",
           "PORCH",
           "RECEPTION",
           "MAILBOX",
           "OTHER"
         ]},
      specialInstructions: {:string, :generic}
    ]
  end
end
