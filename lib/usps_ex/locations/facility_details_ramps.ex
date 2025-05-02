defmodule UspsEx.Locations.FacilityDetailsRamps do
  @moduledoc """
  Provides struct and type for a FacilityDetailsRamps
  """

  @type t :: %__MODULE__{numberOfRamps: integer | nil, widestRamp: integer | nil}

  defstruct [:numberOfRamps, :widestRamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [numberOfRamps: :integer, widestRamp: :integer]
  end
end
