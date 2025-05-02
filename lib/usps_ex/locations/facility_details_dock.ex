defmodule UspsEx.Locations.FacilityDetailsDock do
  @moduledoc """
  Provides struct and type for a FacilityDetailsDock
  """

  @type t :: %__MODULE__{depth: integer | nil, height: integer | nil, width: integer | nil}

  defstruct [:depth, :height, :width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [depth: :integer, height: :integer, width: :integer]
  end
end
