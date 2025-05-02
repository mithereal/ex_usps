defmodule UspsEx.Locations.FacilityDetailsLiftTypes do
  @moduledoc """
  Provides struct and type for a FacilityDetailsLiftTypes
  """

  @type t :: %__MODULE__{
          cageStackerLift: boolean | nil,
          electricGasLift: boolean | nil,
          manualLift: boolean | nil,
          rollerTableExtenderLift: boolean | nil
        }

  defstruct [:cageStackerLift, :electricGasLift, :manualLift, :rollerTableExtenderLift]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cageStackerLift: :boolean,
      electricGasLift: :boolean,
      manualLift: :boolean,
      rollerTableExtenderLift: :boolean
    ]
  end
end
