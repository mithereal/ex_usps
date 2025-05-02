defmodule UspsEx.Locations.SpecialHoursOfOperation do
  @moduledoc """
  Provides struct and type for a SpecialHoursOfOperation
  """

  @type t :: %__MODULE__{
          date: Date.t() | nil,
          open: boolean | nil,
          times: [UspsEx.Locations.SpecialHoursOfOperationTimes.t()] | nil
        }

  defstruct [:date, :open, :times]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      date: {:string, :date},
      open: :boolean,
      times: [{UspsEx.Locations.SpecialHoursOfOperationTimes, :t}]
    ]
  end
end
