defmodule UspsEx.Address.Resources do
  @moduledoc """
  Provides API endpoints related to Addresses Resources
  """

  @default_client UspsEx.Client
  @version "3.2.0"

  @doc """
  Returns the best standardized address for a given address.

  Standardizes street addresses including city and street abbreviations as well as providing missing information such as ZIP Code&#8482; and ZIP + 4&#174;.

  Must specify a street address, a state, and either a city or a ZIP Code&#8482;.

  ## Options

    * `firm`: Firm/business corresponding to the address.
    * `streetAddress`: The number of a building along with the name of the road or street on which it is located.
    * `secondaryAddress`: The secondary unit designator, such as apartment(APT) or suite(STE) number, defining the exact location of the address within a building.  For more information please see [Postal Explorer](https://pe.usps.com/text/pub28/28c2_003.htm).
    * `city`: This is the city name of the address.
    * `state`: The two-character state code of the address.
    * `urbanization`: This is the urbanization code relevant only for Puerto Rico addresses.
    * `ZIPCode`: This is the 5-digit ZIP code.
    * `ZIPPlus4`: This is the 4-digit component of the ZIP+4 code. Using the correct ZIP+4 reduces the number of times your mail is handled and can decrease the chance of a misdelivery or error.

  """
  @spec get_address(keyword) ::
          {:ok, UspsEx.Address.Response.t()} | {:error, UspsEx.ErrorMessage.t()}
  def get_address(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :ZIPCode,
        :ZIPPlus4,
        :city,
        :firm,
        :secondaryAddress,
        :state,
        :streetAddress,
        :urbanization
      ])

    client.request(%{
      args: [],
      call: {UspsEx.Address.Resources, :get_address},
      url: "/address",
      method: :get,
      query: query,
      response: [
        {200, {UspsEx.Address.Response, :t}},
        {400, {UspsEx.ErrorMessage, :t}},
        {401, {UspsEx.ErrorMessage, :t}},
        {403, {UspsEx.ErrorMessage, :t}},
        {404, {UspsEx.ErrorMessage, :t}},
        {429, {UspsEx.ErrorMessage, :t}},
        {503, {UspsEx.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Returns the city and state for a given ZIP Code.

  Returns the city and state corresponding to the given ZIP Code&#8482;.

  ## Options

    * `ZIPCode`: This is the 5-digit ZIP code.

  """
  @spec get_city_state(keyword) ::
          {:ok, UspsEx.Address.CityState.Response.t()} | {:error, UspsEx.ErrorMessage.t()}
  def get_city_state(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ZIPCode])

    client.request(%{
      args: [],
      call: {UspsEx.Address.Resources, :get_city_state},
      url: "/city-state",
      method: :get,
      query: query,
      response: [
        {200, {UspsEx.Address.CityState.Response, :t}},
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
  Returns the ZIP Code for a given address.

  Returns the ZIP Code&#8482; and ZIP + 4&#174; corresponding to the given address, city, and state (use USPS state abbreviations).

  ## Options

    * `firm`: Firm/business corresponding to the address.
    * `streetAddress`: The number of a building along with the name of the road or street on which it is located.
    * `secondaryAddress`: The secondary unit designator, such as apartment(APT) or suite(STE) number, defining the exact location of the address within a building.  For more information please see [Postal Explorer](https://pe.usps.com/text/pub28/28c2_003.htm).
    * `city`: This is the city name of the address.
    * `state`: This is the two-character state code of the address.
    * `ZIPCode`: This is the 5-digit ZIP code.
    * `ZIPPlus4`: This is the 4-digit component of the ZIP+4 code. Using the correct ZIP+4 reduces the number of times your mail is handled and can decrease the chance of a misdelivery or error.

  """
  @spec get_zip_code(keyword) ::
          {:ok, UspsEx.ZIPCodeResponse.t()} | {:error, UspsEx.ErrorMessage.t()}
  def get_zip_code(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :ZIPCode,
        :ZIPPlus4,
        :city,
        :firm,
        :secondaryAddress,
        :state,
        :streetAddress
      ])

    client.request(%{
      args: [],
      call: {UspsEx.Address.Resources, :get_zip_code},
      url: "/zipcode",
      method: :get,
      query: query,
      response: [
        {200, {UspsEx.Address.ZIPCode.Response, :t}},
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

  def version()do
    {:ok, @version}
  end
end
