defmodule UspsEx.Locations.FacilityDetailsLevelers do
  @moduledoc """
  Provides struct and type for a FacilityDetailsLevelers
  """

  @type t :: %__MODULE__{
          hydraulicLevelers: integer | nil,
          manualLevelers: integer | nil,
          scissorLevelers: integer | nil
        }

  defstruct [:hydraulicLevelers, :manualLevelers, :scissorLevelers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [hydraulicLevelers: :integer, manualLevelers: :integer, scissorLevelers: :integer]
  end
end
