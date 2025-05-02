defmodule UspsEx.DomesticPrices.Resources do
  @moduledoc """
  Provides API endpoints related to resources
  """

  @default_client UspsEx.Client

  @doc """
  Performs a search for base price using the submitted rate ingredients.

  Returns an eligible price given a set of package rate ingredients.
  """
  @spec post_base_rates_search(UspsEx.DomesticPrices.BaseRatesQuery.t(), keyword) ::
          {:ok, UspsEx.DomesticPrices.BaseRateOption.t()}
          | {:error, UspsEx.DomesticPrices.ErrorMessage.t()}
  def post_base_rates_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.DomesticPrices.Resources, :post_base_rates_search},
      url: "/base-rates/search",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.DomesticPrices.BaseRatesQuery, :t}},
        {"application/xml", {UspsEx.DomesticPrices.BaseRatesQuery, :t}}
      ],
      response: [
        {200, {UspsEx.DomesticPrices.BaseRateOption, :t}},
        {400, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {401, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {403, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {404, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {429, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {503, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Search for extra services using rate ingredients.

  Returns eligible extra service prices, descriptions, and SKUs given a set of package rate ingredients. 
  NOTE: The request using an integer (instead of an array) for extraServices is deprecated and will be removed in June 2025.

  """
  @spec post_extra_service_rates_search(
          UspsEx.DomesticPrices.ExtraServiceRateQuery.t()
          | UspsEx.DomesticPrices.ExtraServiceRateQueryWithSingleExtraService.t(),
          keyword
        ) ::
          {:ok, [UspsEx.DomesticPrices.ExtraServiceRateDetails.t()]}
          | {:error, UspsEx.DomesticPrices.ErrorMessage.t()}
  def post_extra_service_rates_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.DomesticPrices.Resources, :post_extra_service_rates_search},
      url: "/extra-service-rates/search",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {UspsEx.DomesticPrices.ExtraServiceRateQuery, :t},
            {UspsEx.DomesticPrices.ExtraServiceRateQueryWithSingleExtraService, :t}
          ]}},
        {"application/xml",
         {:union,
          [
            {UspsEx.DomesticPrices.ExtraServiceRateQuery, :t},
            {UspsEx.DomesticPrices.ExtraServiceRateQueryWithSingleExtraService, :t}
          ]}}
      ],
      response: [
        {200, [{UspsEx.DomesticPrices.ExtraServiceRateDetails, :t}]},
        {400, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {401, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {403, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {404, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {429, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {503, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Performs a search for letter prices using the submitted rate ingredients.

  Returns an eligible price given a set of package rate ingredients.

  """
  @spec post_letter_rates_search(UspsEx.DomesticPrices.LetterRatesQuery.t(), keyword) ::
          {:ok, UspsEx.DomesticPrices.LetterRatesOption.t()}
          | {:error, UspsEx.DomesticPrices.ErrorMessage.t()}
  def post_letter_rates_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.DomesticPrices.Resources, :post_letter_rates_search},
      url: "/letter-rates/search",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.DomesticPrices.LetterRatesQuery, :t}},
        {"application/xml", {UspsEx.DomesticPrices.LetterRatesQuery, :t}}
      ],
      response: [
        {200, {UspsEx.DomesticPrices.LetterRatesOption, :t}},
        {400, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {401, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {403, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {404, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {429, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {503, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Search for eligible products using rate ingredients.

  Returns a list of eligible prices given dimensions/weight/destination of pieces.

  Search for contract prices; either by:

  * Enterprise Payment System (EPS) account
  * Meter number
  * Permit number

  A specific mail class is required when searching for contract prices.

  """
  @spec post_rate_list(UspsEx.DomesticPrices.RateListQuery.t(), keyword) ::
          {:ok, UspsEx.DomesticPrices.BaseRatesQueryResult.t()}
          | {:error, UspsEx.DomesticPrices.ErrorMessage.t()}
  def post_rate_list(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.DomesticPrices.Resources, :post_rate_list},
      url: "/base-rates-list/search",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.DomesticPrices.RateListQuery, :t}},
        {"application/xml", {UspsEx.DomesticPrices.RateListQuery, :t}}
      ],
      response: [
        {200, {UspsEx.DomesticPrices.BaseRatesQueryResult, :t}},
        {400, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {401, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {403, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {404, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {429, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {503, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Returns a list of eligible prices including extra service fees given a set of package rate ingredients.

  This API returns a list of eligible prices, including extra service fees, given the dimensions, weight, origin and destination of your package.
  """
  @spec post_total_rates_search(UspsEx.DomesticPrices.TotalRatesQuery.t(), keyword) ::
          {:ok, UspsEx.DomesticPrices.TotalRatesQueryResult.t()}
          | {:error, UspsEx.DomesticPrices.ErrorMessage.t()}
  def post_total_rates_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.DomesticPrices.Resources, :post_total_rates_search},
      url: "/total-rates/search",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.DomesticPrices.TotalRatesQuery, :t}},
        {"application/xml", {UspsEx.DomesticPrices.TotalRatesQuery, :t}}
      ],
      response: [
        {200, {UspsEx.DomesticPrices.TotalRatesQueryResult, :t}},
        {400, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {401, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {403, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {404, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {429, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        {503, {UspsEx.DomesticPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end
end
