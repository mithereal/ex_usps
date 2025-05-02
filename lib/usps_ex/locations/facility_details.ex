defmodule UspsEx.Locations.FacilityDetails do
  @moduledoc """
  Provides struct and type for a FacilityDetails
  """

  @type t :: %__MODULE__{
          canopyClearance: integer | nil,
          dock: UspsEx.Locations.FacilityDetailsDock.t() | nil,
          doorDetails: UspsEx.Locations.FacilityDetailsDoorDetails.t() | nil,
          levelers: UspsEx.Locations.FacilityDetailsLevelers.t() | nil,
          liftTypes: UspsEx.Locations.FacilityDetailsLiftTypes.t() | nil,
          overpassDetails: UspsEx.Locations.FacilityDetailsOverpassDetails.t() | nil,
          ramps: UspsEx.Locations.FacilityDetailsRamps.t() | nil,
          truckManeuveringArea: UspsEx.Locations.FacilityDetailsTruckManeuveringArea.t() | nil
        }

  defstruct [
    :canopyClearance,
    :dock,
    :doorDetails,
    :levelers,
    :liftTypes,
    :overpassDetails,
    :ramps,
    :truckManeuveringArea
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      canopyClearance: :integer,
      dock: {UspsEx.Locations.FacilityDetailsDock, :t},
      doorDetails: {UspsEx.Locations.FacilityDetailsDoorDetails, :t},
      levelers: {UspsEx.Locations.FacilityDetailsLevelers, :t},
      liftTypes: {UspsEx.Locations.FacilityDetailsLiftTypes, :t},
      overpassDetails: {UspsEx.Locations.FacilityDetailsOverpassDetails, :t},
      ramps: {UspsEx.Locations.FacilityDetailsRamps, :t},
      truckManeuveringArea: {UspsEx.Locations.FacilityDetailsTruckManeuveringArea, :t}
    ]
  end
end
