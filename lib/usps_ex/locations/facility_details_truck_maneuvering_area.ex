defmodule UspsEx.Locations.FacilityDetailsTruckManeuveringArea do
  @moduledoc """
  Provides struct and type for a FacilityDetailsTruckManeuveringArea
  """

  @type t :: %__MODULE__{
          length: integer | nil,
          surfaceType: String.t() | nil,
          width: integer | nil
        }

  defstruct [:length, :surfaceType, :width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      length: :integer,
      surfaceType: {:enum, ["ASPHALT", "DIRT", "CONCRETE", "GRAVEL", "OTHER"]},
      width: :integer
    ]
  end
end
