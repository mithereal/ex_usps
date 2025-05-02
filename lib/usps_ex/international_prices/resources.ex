defmodule UspsEx.InternationalPrices.Resources do
  @moduledoc """
  Provides API endpoints related to resources
  """

  @default_client UspsEx.InternationalPrices.Client

  @doc """
  Performs a search for international SKUs and price using the submitted rate ingredients.

  Given a set of SSF or scan-based rate ingredients, returns a international rates.
  Include contract-based rates in the results when the contractId and productId are present.

  """
  @spec get_international_base_rates_search(
          UspsEx.InternationalPrices.BaseRatesQuery.t(),
          keyword
        ) ::
          {:ok, UspsEx.InternationalPrices.RateOption.t()}
          | {:error, UspsEx.InternationalPrices.ErrorMessage.t()}
  def get_international_base_rates_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.InternationalPrices.Resources, :get_international_base_rates_search},
      url: "/base-rates/search",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.InternationalPrices.BaseRatesQuery, :t}},
        {"application/xml", {UspsEx.InternationalPrices.BaseRatesQuery, :t}}
      ],
      response: [
        {200, {UspsEx.InternationalPrices.RateOption, :t}},
        {400, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {401, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {403, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {404, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {429, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {503, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Performs a search for international extra service SKUs using the submitted rate ingredients.

  Given a set of rate ingredients, returns international extra service rates.
  If contractId and productId are present, include contract-based rates in the results.

  """
  @spec get_international_extra_service_rates_search(
          UspsEx.InternationalPrices.ExtraServiceRateQuery.t(),
          keyword
        ) ::
          {:ok, [UspsEx.InternationalPrices.ExtraServiceRateDetailsInner.t()]}
          | {:error, UspsEx.InternationalPrices.ErrorMessage.t()}
  def get_international_extra_service_rates_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.InternationalPrices.Resources, :get_international_extra_service_rates_search},
      url: "/extra-service-rates/search",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.InternationalPrices.ExtraServiceRateQuery, :t}},
        {"application/xml", {UspsEx.InternationalPrices.ExtraServiceRateQuery, :t}}
      ],
      response: [
        {200, [{UspsEx.InternationalPrices.ExtraServiceRateDetailsInner, :t}]},
        {400, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {401, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {403, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {404, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {429, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {503, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Performs a search for a International rate (outbound only) using the submitted values.

  Given size/weight/destination of pieces, returns a list of potential rates. Can also search for contract rates by providing mailer id, EPS, permit number or vendor number and account.     If searching for contract rates, then a specified mail class is required.

  """
  @spec get_rate_list(UspsEx.InternationalPrices.InternationalRateListQuery.t(), keyword) ::
          {:ok, UspsEx.InternationalPrices.InternationalRateListQueryResult.t()}
          | {:error, UspsEx.InternationalPrices.ErrorMessage.t()}
  def get_rate_list(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.InternationalPrices.Resources, :get_rate_list},
      url: "/base-rates-list/search",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.InternationalPrices.InternationalRateListQuery, :t}},
        {"application/xml", {UspsEx.InternationalPrices.InternationalRateListQuery, :t}}
      ],
      response: [
        {200, {UspsEx.InternationalPrices.InternationalRateListQueryResult, :t}},
        {400, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {401, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {403, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {404, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {429, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {503, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Performs a search for letter prices using the submitted rate ingredients.

  Returns an eligible price given a set of package rate ingredients.

  """
  @spec post_letter_rates_search(
          UspsEx.InternationalPrices.InternationalLetterRatesQuery.t(),
          keyword
        ) ::
          {:ok, UspsEx.InternationalPrices.LetterRatesOption.t()}
          | {:error, UspsEx.InternationalPrices.ErrorMessage.t()}
  def post_letter_rates_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.InternationalPrices.Resources, :post_letter_rates_search},
      url: "/letter-rates/search",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.InternationalPrices.InternationalLetterRatesQuery, :t}},
        {"application/xml", {UspsEx.InternationalPrices.InternationalLetterRatesQuery, :t}}
      ],
      response: [
        {200, {UspsEx.InternationalPrices.LetterRatesOption, :t}},
        {400, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {401, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {403, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {404, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {429, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {503, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Returns an eligible price given a set of package rate ingredients.

  Performs a search for base price and extraServices using the submitted rate ingredients.  If itemValue is not included the response will not include insurance, registered mail, and collect on delivery extra services.  If the extraService array is not specified then all eligible extra services will be included.

  """
  @spec post_total_rates_search(UspsEx.InternationalPrices.TotalRatesQuery.t(), keyword) ::
          {:ok, UspsEx.InternationalPrices.TotalRatesQueryResult.t()}
          | {:error, UspsEx.InternationalPrices.ErrorMessage.t()}
  def post_total_rates_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.InternationalPrices.Resources, :post_total_rates_search},
      url: "/total-rates/search",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.InternationalPrices.TotalRatesQuery, :t}},
        {"application/xml", {UspsEx.InternationalPrices.TotalRatesQuery, :t}}
      ],
      response: [
        {200, {UspsEx.InternationalPrices.TotalRatesQueryResult, :t}},
        {400, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {401, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {403, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {404, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {429, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        {503, {UspsEx.InternationalPrices.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end
end
