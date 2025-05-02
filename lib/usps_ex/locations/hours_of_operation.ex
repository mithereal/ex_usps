defmodule UspsEx.Locations.HoursOfOperation do
  @moduledoc """
  Provides struct and type for a HoursOfOperation
  """

  @type t :: %__MODULE__{
          dayOfWeek: String.t() | nil,
          times: [UspsEx.Locations.HoursOfOperationTimes.t()] | nil
        }

  defstruct [:dayOfWeek, :times]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dayOfWeek:
        {:enum, ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"]},
      times: [{UspsEx.Locations.HoursOfOperationTimes, :t}]
    ]
  end
end
