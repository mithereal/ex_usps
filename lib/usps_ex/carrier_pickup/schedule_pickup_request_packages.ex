defmodule UspsEx.CarrierPickup.SchedulePickupRequestPackages do
  @moduledoc """
  Provides struct and type for a SchedulePickupRequestPackages
  """

  @type t :: %__MODULE__{packageCount: integer, packageType: String.t()}

  defstruct [:packageCount, :packageType]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      packageCount: :integer,
      packageType:
        {:enum,
         [
           "FIRST-CLASS_PACKAGE_SERVICE",
           "PRIORITY_MAIL_EXPRESS",
           "PRIORITY_MAIL",
           "RETURNS",
           "USPS_GROUND_ADVANTAGE",
           "INTERNATIONAL",
           "OTHER"
         ]}
    ]
  end
end
