defmodule UspsEx.Locations.DropShipmentLocationFacilityAddress do
  @moduledoc """
  Provides struct and type for a DropShipmentLocationFacilityAddress
  """

  @type t :: %__MODULE__{address: UspsEx.Locations.DomesticAddress.t() | nil}

  defstruct [:address]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [address: {UspsEx.Locations.DomesticAddress, :t}]
  end
end
