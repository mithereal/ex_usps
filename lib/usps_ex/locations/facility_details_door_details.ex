defmodule UspsEx.Locations.FacilityDetailsDoorDetails do
  @moduledoc """
  Provides struct and type for a FacilityDetailsDoorDetails
  """

  @type t :: %__MODULE__{
          height: integer | nil,
          numberOfSteps: integer | nil,
          width: integer | nil
        }

  defstruct [:height, :numberOfSteps, :width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [height: :integer, numberOfSteps: :integer, width: :integer]
  end
end
