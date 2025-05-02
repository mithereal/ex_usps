defmodule UspsEx.Locations.PostOfficeLocation do
  @moduledoc """
  Provides struct and type for a PostOfficeLocation
  """

  @type t :: %__MODULE__{
          DSTObserved: boolean | nil,
          distance: number | nil,
          facilityAddress: UspsEx.Locations.PostOfficeLocationFacilityAddress.t() | nil,
          facilityID: String.t() | nil,
          facilityName: String.t() | nil,
          geoCoordinates: UspsEx.Locations.PostOfficeLocationGeoCoordinates.t() | nil,
          parking: String.t() | nil,
          passports: UspsEx.Locations.PostOfficeLocationPassports.t() | nil,
          phoneNumbers: UspsEx.Locations.PostOfficeLocationPhoneNumbers.t() | nil,
          postOfficeType: String.t() | nil,
          services: [UspsEx.Locations.PostOfficeLocationServices.t()] | nil,
          specialHours: [UspsEx.Locations.SpecialHoursOfOperation.t()] | nil,
          temporaryClosure: boolean | nil,
          temporaryClosureDate: Date.t() | nil,
          timeZone: String.t() | nil
        }

  defstruct [
    :DSTObserved,
    :distance,
    :facilityAddress,
    :facilityID,
    :facilityName,
    :geoCoordinates,
    :parking,
    :passports,
    :phoneNumbers,
    :postOfficeType,
    :services,
    :specialHours,
    :temporaryClosure,
    :temporaryClosureDate,
    :timeZone
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      DSTObserved: :boolean,
      distance: :number,
      facilityAddress: {UspsEx.Locations.PostOfficeLocationFacilityAddress, :t},
      facilityID: {:string, :generic},
      facilityName: {:string, :generic},
      geoCoordinates: {UspsEx.Locations.PostOfficeLocationGeoCoordinates, :t},
      parking: {:enum, ["LOT", "STREET"]},
      passports: {UspsEx.Locations.PostOfficeLocationPassports, :t},
      phoneNumbers: {UspsEx.Locations.PostOfficeLocationPhoneNumbers, :t},
      postOfficeType:
        {:enum,
         ["CONTRACT_POSTAL_UNIT", "POST_OFFICE", "SELF_SERVICE_KIOSK", "VILLAGE_POST_OFFICE"]},
      services: [{UspsEx.Locations.PostOfficeLocationServices, :t}],
      specialHours: [{UspsEx.Locations.SpecialHoursOfOperation, :t}],
      temporaryClosure: :boolean,
      temporaryClosureDate: {:string, :date},
      timeZone: {:string, :generic}
    ]
  end
end
