defmodule UspsEx.Locations.DropShipmentLocation do
  @moduledoc """
  Provides struct and type for a DropShipmentLocation
  """

  @type t :: %__MODULE__{
          DSTObserved: boolean | nil,
          USPSConnectDetails: UspsEx.Locations.USPSConnect.t() | nil,
          acceptedPackageTypes: [UspsEx.Locations.AcceptedPackageTypes.t()] | nil,
          destinationEntryFacilityType: String.t() | nil,
          destinationZIPCode: String.t() | nil,
          dropShipAcceptanceTimes: [UspsEx.Locations.HoursOfOperation.t()] | nil,
          dropShipmentFacilityDetails: UspsEx.Locations.FacilityDetails.t() | nil,
          dropShipmentKey: String.t() | nil,
          dropSitePhoneNumber: String.t() | nil,
          facilityAddress: UspsEx.Locations.DropShipmentLocationFacilityAddress.t() | nil,
          facilityName: String.t() | nil,
          timeZone: String.t() | nil
        }

  defstruct [
    :DSTObserved,
    :USPSConnectDetails,
    :acceptedPackageTypes,
    :destinationEntryFacilityType,
    :destinationZIPCode,
    :dropShipAcceptanceTimes,
    :dropShipmentFacilityDetails,
    :dropShipmentKey,
    :dropSitePhoneNumber,
    :facilityAddress,
    :facilityName,
    :timeZone
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      DSTObserved: :boolean,
      USPSConnectDetails: {UspsEx.Locations.USPSConnect, :t},
      acceptedPackageTypes: [{UspsEx.Locations.AcceptedPackageTypes, :t}],
      destinationEntryFacilityType:
        {:enum,
         [
           "DESTINATION_NETWORK_DISTRIBUTION_CENTER",
           "DESTINATION_SECTIONAL_CENTER_FACILITY",
           "DESTINATION_SERVICE_HUB",
           "DESTINATION_DELIVERY_UNIT"
         ]},
      destinationZIPCode: {:string, :generic},
      dropShipAcceptanceTimes: [{UspsEx.Locations.HoursOfOperation, :t}],
      dropShipmentFacilityDetails: {UspsEx.Locations.FacilityDetails, :t},
      dropShipmentKey: {:string, :generic},
      dropSitePhoneNumber: {:string, :generic},
      facilityAddress: {UspsEx.Locations.DropShipmentLocationFacilityAddress, :t},
      facilityName: {:string, :generic},
      timeZone: {:string, :generic}
    ]
  end
end
