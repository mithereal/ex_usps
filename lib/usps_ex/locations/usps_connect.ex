defmodule UspsEx.Locations.USPSConnect do
  @moduledoc """
  Provides struct and type for a USPSConnect
  """

  @type t :: %__MODULE__{
          SundayDelivery: boolean | nil,
          nextDayDropOffCutOffTimes: [UspsEx.Locations.CutOffTimesDropOff.t()] | nil,
          nextDayPickUp: String.t() | nil,
          sameDayCarrierPickupCutOffTimes: [UspsEx.Locations.CutOffTimesPickup.t()] | nil,
          sameDayDelivery: boolean | nil,
          sameDayDropOffCutOffTimes: [UspsEx.Locations.CutOffTimesDropOff.t()] | nil,
          sameDayPickUp: String.t() | nil
        }

  defstruct [
    :SundayDelivery,
    :nextDayDropOffCutOffTimes,
    :nextDayPickUp,
    :sameDayCarrierPickupCutOffTimes,
    :sameDayDelivery,
    :sameDayDropOffCutOffTimes,
    :sameDayPickUp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      SundayDelivery: :boolean,
      nextDayDropOffCutOffTimes: [{UspsEx.Locations.CutOffTimesDropOff, :t}],
      nextDayPickUp: {:string, :generic},
      sameDayCarrierPickupCutOffTimes: [{UspsEx.Locations.CutOffTimesPickup, :t}],
      sameDayDelivery: :boolean,
      sameDayDropOffCutOffTimes: [{UspsEx.Locations.CutOffTimesDropOff, :t}],
      sameDayPickUp: {:string, :generic}
    ]
  end
end
