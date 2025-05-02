defmodule UspsEx.CarrierPickup.Resources do
  @moduledoc """
  Provides API endpoints related to resources
  """

  @default_client UspsEx.Client

  @doc """
  Cancel a previously scheduled carrier pickup.

  Cancel a previously scheduled carrier pick up.
  A carrier pickup can no longer be updated or cancelled once cancelled.
  A successful response indicates the carrier pickup has been cancelled.
  """
  @spec delete_carrier_pickup_confirmation_number(String.t(), keyword) ::
          :ok | {:error, UspsEx.ErrorMessage.t()}
  def delete_carrier_pickup_confirmation_number(confirmationNumber, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [confirmationNumber: confirmationNumber],
      call: {UspsEx.Resources, :delete_carrier_pickup_confirmation_number},
      url: "/carrier-pickup/#{confirmationNumber}",
      method: :delete,
      response: [
        {200, :null},
        {400, {UspsEx.ErrorMessage, :t}},
        {401, {UspsEx.ErrorMessage, :t}},
        {403, {UspsEx.ErrorMessage, :t}},
        {429, {UspsEx.ErrorMessage, :t}},
        {503, {UspsEx.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Get a previously scheduled carrier pickup.

  Get the previously scheduled carrier pickup by confirmation number.
  Responds with the entity tag (ETag) to use when updating or cancelling this pickup.
  """
  @spec get_carrier_pickup_confirmation_number(String.t(), keyword) ::
          {:ok, [UspsEx.CarrierPickup.PickupConfirmation.t()]} | {:error, UspsEx.ErrorMessage.t()}
  def get_carrier_pickup_confirmation_number(confirmationNumber, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [confirmationNumber: confirmationNumber],
      call: {UspsEx.CarrierPickup.Resources, :get_carrier_pickup_confirmation_number},
      url: "/carrier-pickup/#{confirmationNumber}",
      method: :get,
      response: [
        {200, [{UspsEx.CarrierPickup.PickupConfirmation, :t}]},
        {400, {UspsEx.ErrorMessage, :t}},
        {401, {UspsEx.ErrorMessage, :t}},
        {403, {UspsEx.ErrorMessage, :t}},
        {429, {UspsEx.ErrorMessage, :t}},
        {503, {UspsEx.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Check pick-up address eligibility.

  Check carrier pickup service availability at the specified address.
  Either the city and state or the ZIP Code&#8482; is required, in addition to the street address.
  Successful responses include the USPS standardized address when this location is eligible for carrier pickup.

  ## Options

    * `streetAddress`: The number of a building along with the name of the road or street on which it is located.
    * `secondaryAddress`: The secondary unit designator, such as apartment(APT) or suite(STE) number, defining the exact location of the address within a building.  For more information please see [Postal Explorer](https://pe.usps.com/text/pub28/28c2_003.htm).
    * `city`: This is the city name of the address.
    * `state`: This is two-character state code of the address.
    * `ZIPCode`: This is the 5-digit ZIP code.
    * `ZIPPlus4`: This is the 4-digit component of the ZIP+4 code. Using the correct Zip+4 reduces the number of times your mail is handled and can decrease the chance of a misdelivery or error.
    * `urbanization`: This is the urbanization code relevant only for Puerto Rico addresses.

  """
  @spec get_carrier_pickup_eligibility(keyword) ::
          {:ok, UspsEx.CarrierPickup.PickupAddress.t()} | {:error, UspsEx.ErrorMessage.t()}
  def get_carrier_pickup_eligibility(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :ZIPCode,
        :ZIPPlus4,
        :city,
        :secondaryAddress,
        :state,
        :streetAddress,
        :urbanization
      ])

    client.request(%{
      args: [],
      call: {UspsEx.CarrierPickup.Resources, :get_carrier_pickup_eligibility},
      url: "/carrier-pickup/eligibility",
      method: :get,
      query: query,
      response: [
        {200, {UspsEx.CarrierPickup.PickupAddress, :t}},
        {400, {UspsEx.ErrorMessage, :t}},
        {401, {UspsEx.ErrorMessage, :t}},
        {403, {UspsEx.ErrorMessage, :t}},
        {429, {UspsEx.ErrorMessage, :t}},
        {503, {UspsEx.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Schedule a carrier pickup.

  Schedule a carrier pickup on a specified date.
  You can schedule pickups Monday - Saturday until 2:00 AM CT on the day of the pickup. After 2:00 AM CT, same-day pickup is not available.
  If the address is eligible for carrier pickup, then you can schedule your pickup up to one year in advance.
  """
  @spec post_carrier_pickup(UspsEx.CarrierPickup.SchedulePickupRequest.t(), keyword) ::
          {:ok, UspsEx.CarrierPickup.PickupConfirmation.t()} | {:error, UspsEx.ErrorMessage.t()}
  def post_carrier_pickup(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.CarrierPickup.Resources, :post_carrier_pickup},
      url: "/carrier-pickup",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.CarrierPickup.SchedulePickupRequest, :t}},
        {"application/xml", {UspsEx.CarrierPickup.SchedulePickupRequest, :t}}
      ],
      response: [
        {200, {UspsEx.CarrierPickup.PickupConfirmation, :t}},
        {400, {UspsEx.ErrorMessage, :t}},
        {401, {UspsEx.ErrorMessage, :t}},
        {403, {UspsEx.ErrorMessage, :t}},
        {429, {UspsEx.ErrorMessage, :t}},
        {503, {UspsEx.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Update a previously scheduled carrier pickup.

  Update information contained in a previously scheduled carrier pickup such as the pickup date, the types and counts of packages for the carrier to pick up, the weight or the pickup location.
  """
  @spec put_carrier_pickup_confirmation_number(String.t(), UspsEx.CarrierPickup.PickupConfirmation.t(), keyword) ::
          {:ok, UspsEx.CarrierPickup.PickupConfirmation.t()} | {:error, UspsEx.ErrorMessage.t()}
  def put_carrier_pickup_confirmation_number(confirmationNumber, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [confirmationNumber: confirmationNumber, body: body],
      call: {UspsEx.CarrierPickup.Resources, :put_carrier_pickup_confirmation_number},
      url: "/carrier-pickup/#{confirmationNumber}",
      body: body,
      method: :put,
      request: [
        {"application/json", {UspsEx.CarrierPickup.PickupConfirmation, :t}},
        {"application/xml", {UspsEx.CarrierPickup.PickupConfirmation, :t}}
      ],
      response: [
        {200, {UspsEx.CarrierPickup.PickupConfirmation, :t}},
        {400, {UspsEx.ErrorMessage, :t}},
        {401, {UspsEx.ErrorMessage, :t}},
        {403, {UspsEx.ErrorMessage, :t}},
        {429, {UspsEx.ErrorMessage, :t}},
        {503, {UspsEx.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end
end
