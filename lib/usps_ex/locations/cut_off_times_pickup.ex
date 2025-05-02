defmodule UspsEx.Locations.CutOffTimesPickup do
  @moduledoc """
  Provides struct and type for a CutOffTimesPickup
  """

  @type t :: %__MODULE__{cutOffTime: String.t() | nil, dayOfWeek: String.t() | nil}

  defstruct [:cutOffTime, :dayOfWeek]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cutOffTime: {:string, :generic},
      dayOfWeek:
        {:enum,
         ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY", "HOLIDAY"]}
    ]
  end
end
