defmodule UspsEx.Locations.FacilityDetailsOverpassDetails do
  @moduledoc """
  Provides struct and type for a FacilityDetailsOverpassDetails
  """

  @type t :: %__MODULE__{lowestOverpass: integer | nil, numberOfOverpasses: integer | nil}

  defstruct [:lowestOverpass, :numberOfOverpasses]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [lowestOverpass: :integer, numberOfOverpasses: :integer]
  end
end
