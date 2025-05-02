defmodule UspsEx.Locations.Resources do
  @moduledoc """
  Provides API endpoints related to resources
  """

  @default_client UspsEx.Locations.Client

  @doc """
  Lookup a valid entry location for destination entry parcels

  The Drop Off Location API can be used to find convenient 
  USPS&#174; entry facilities for destination entry volume. If you supply a valid
  5-digit destination ZIP Code&#8482; and optional parameters you will be provided 
  with one or more acceptable entry locations which can be utilized to prevent mis-shipped adjustments. 

  This API can be used in lieu of the Parcel, Address, and Mail Direction Files 
  currently available through FAST. 

  ## Options

    * `destinationZIPCode`: The destination ZIP Code&#8482; of the package.
    * `destinationZIPPlus4`: This is the 4-digit component of the ZIP+4 code. Using the correct Zip+4 reduces the number of times your mail is handled and can decrease the chance of a misdelivery or error.
    * `mailClass`: The mail class of the package being shipped:
        example: PARCEL_SELECT
    * `processingCategory`: The shape of the package being shipped, for more information on package shapes see the [Physical Standards for Parcels](https://pe.usps.com/text/dmm300/201.htm#ep1097220).
      
      Note:
      - `IRREGULAR` is deprecated as of 2/1/2025 and will convert to `NONSTANDARD`.
      - `NON_MACHINABLE` is deprecated as of 2/1/2025 and will convert to `NONSTANDARD`.
      
    * `destinationEntryFacilityType`: Indicates the facility type at which the packages will be dropped off.
    * `palletized`: Indicates if the shipment or part of the shipment is being received on a pallet.
    * `mailingDate`: The date the package will be mailed.
      Defaults to today when omitted.
      The mailing date may be today plus 0 to 7 days in advance.
      Enter the date in the full-date notation as defined by [RFC 3339, section 5.6](https://datatracker.ietf.org/doc/html/rfc3339#section-5.6).
      

  """
  @spec get_dropoff_location(keyword) ::
          {:ok, [UspsEx.Locations.DropShipmentLocation.t()]}
          | {:error, UspsEx.Locations.ErrorMessage.t()}
  def get_dropoff_location(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :destinationEntryFacilityType,
        :destinationZIPCode,
        :destinationZIPPlus4,
        :mailClass,
        :mailingDate,
        :palletized,
        :processingCategory
      ])

    client.request(%{
      args: [],
      call: {UspsEx.Locations.Resources, :get_dropoff_location},
      url: "/dropoff-locations",
      method: :get,
      query: query,
      response: [
        {200, [{UspsEx.Locations.DropShipmentLocation, :t}]},
        {400, {UspsEx.Locations.ErrorMessage, :t}},
        {401, {UspsEx.Locations.ErrorMessage, :t}},
        {403, {UspsEx.Locations.ErrorMessage, :t}},
        {429, {UspsEx.Locations.ErrorMessage, :t}},
        {503, {UspsEx.Locations.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @type get_post_office_location_200__resp :: %{
          locations: [UspsEx.Locations.PostOfficeLocation.t()] | nil,
          metadata: UspsEx.Locations.PaginationMetadata.t() | nil
        }

  @type get_post_office_location_200_json_resp :: %{
          locations: [UspsEx.Locations.PostOfficeLocation.t()] | nil,
          metadata: UspsEx.Locations.PaginationMetadata.t() | nil,
          warnings:
            [UspsEx.Locations.ResourcesWarnings.get_post_office_location_200_json_resp()] | nil
        }

  @doc """
  Get a list of post office locations based on the search criteria.

  A complete query consists of one of the following:
    * Complete domestic address 
    * City/State Pair 
    * ZIP Code&#8482; 
    * Latitude/Longitude pair

  Users can provide additional filters such as a radius (distance and units, defaults to 20 miles), location type, desired services, open times, and package dimensions.

  ## Options

    * `streetAddress`: The number of a building along with the name of the road or street on which it is located.
    * `secondaryAddress`: The secondary unit designator, such as apartment(APT) or suite(STE) number, defining the exact location of the address within a building.  For more information please see [Postal Explorer](https://pe.usps.com/text/pub28/28c2_003.htm).
    * `city`: This is the city name of the address.
    * `state`: This is two-character state code of the address.
    * `urbanization`: This is the urbanization code relevant only for Puerto Rico addresses.
    * `ZIPCode`: This is the 5-digit ZIP code.
    * `ZIPPlus4`: This is the 4-digit component of the ZIP+4 code. Using the correct Zip+4 reduces the number of times your mail is handled and can decrease the chance of a misdelivery or error.
    * `LAT`: The latitude geo coordinate.
    * `LONG`: The longitude geo coordinate.
    * `postOfficeType`: The type of post office requested.
    * `mailingService`: Mailing Service supported at the facility
    * `businessService`: Business Service supported at the facility
    * `passportService`: Passport Service supported at the facility
    * `pickupService`: Pick-Up Service supported at the facility. If requesting PICKUP_PARCEL_LOCKER then the length, width and height parameters are always required.
    * `financialService`: Financial Service supported at the facility. Effective July 14, 2024, MONEY_ORDER_INTERNATIONAL and SURE_MONEY values will be deprecated and ignored in the request.
    * `hours`: Limit the response Post Office Locations to those supporting Retail Services at the enumerated times. If not provided, all with be returned.
    * `radius`: The max distance (in miles) from the location given to the respective Post Office. If no radius is provided a default radius of 20 miles will be used
    * `length`: This is the package length in inches.  The maximum dimension is always length.
    * `width`: This is the package width in inches.  The second longest dimension is always width.
    * `height`: This is the package height in inches.
    * `offset`: The number of items to skip before returning the results
    * `limit`: The number of items to return

  """
  @spec get_post_office_location(keyword) ::
          {:ok, map} | {:error, UspsEx.Locations.ErrorMessage.t()}
  def get_post_office_location(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :LAT,
        :LONG,
        :ZIPCode,
        :ZIPPlus4,
        :businessService,
        :city,
        :financialService,
        :height,
        :hours,
        :length,
        :limit,
        :mailingService,
        :offset,
        :passportService,
        :pickupService,
        :postOfficeType,
        :radius,
        :secondaryAddress,
        :state,
        :streetAddress,
        :urbanization,
        :width
      ])

    client.request(%{
      args: [],
      call: {UspsEx.Locations.Resources, :get_post_office_location},
      url: "/post-office-locations",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [
            {UspsEx.Locations.Resources, :get_post_office_location_200__resp},
            {UspsEx.Locations.Resources, :get_post_office_location_200_json_resp}
          ]}},
        {400, {UspsEx.Locations.ErrorMessage, :t}},
        {401, {UspsEx.Locations.ErrorMessage, :t}},
        {403, {UspsEx.Locations.ErrorMessage, :t}},
        {429, {UspsEx.Locations.ErrorMessage, :t}},
        {503, {UspsEx.Locations.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_post_office_location_200__resp) do
    [
      locations: [{UspsEx.Locations.PostOfficeLocation, :t}],
      metadata: {UspsEx.Locations.PaginationMetadata, :t}
    ]
  end

  def __fields__(:get_post_office_location_200_json_resp) do
    [
      locations: [{UspsEx.Locations.PostOfficeLocation, :t}],
      metadata: {UspsEx.Locations.PaginationMetadata, :t},
      warnings: [{UspsEx.Locations.ResourcesWarnings, :get_post_office_location_200_json_resp}]
    ]
  end
end
