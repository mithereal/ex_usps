defmodule UspsEx.Payments.Resources do
  @moduledoc """
  Provides API endpoints related to resources
  """

  @default_client UspsEx.Payments.Client

  @doc """
  Payment account inquiry

  You can check if sufficient funds exist in the account, if you pass the amount parameter.  In case you omit the amount parameter, you can still retrieve general information about the account, such as its non-profit status.


  ## Options

    * `accountType`: The type of payment account either Electronic Payment System account or Permit.
    * `permitZIPCode`: The ZIP Code&#8482; associated to the permit number.  This value is required when the account-type is 'PERMIT'.
    * `amount`: If amount is supplied, the account will be checked to see if there are sufficient funds at present to process a payment transaction for that amount.

  """
  @spec get_payment_account_account_number(String.t(), keyword) ::
          {:ok, UspsEx.Payments.PaymentAccount.t()} | {:error, UspsEx.Payments.ErrorMessage.t()}
  def get_payment_account_account_number(account-number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:accountType, :amount, :permitZIPCode])

    client.request(%{
      args: ["account-number": account-number],
      call: {UspsEx.Payments.Resources, :get_payment_account_account_number},
      url: "/payment-account/{account-number}",
      method: :get,
      query: query,
      response: [
        {200, {UspsEx.Payments.PaymentAccount, :t}},
        {400, {UspsEx.Payments.ErrorMessage, :t}},
        {401, {UspsEx.Payments.ErrorMessage, :t}},
        {403, {UspsEx.Payments.ErrorMessage, :t}},
        {404, {UspsEx.Payments.ErrorMessage, :t}},
        {429, {UspsEx.Payments.ErrorMessage, :t}},
        {503, {UspsEx.Payments.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end

  @doc """
  Set payment account information.

  Create a payment authorization token that can be subsequently used for purchasing labels. Tokens are valid for eight hours after issuance.
  The roles input is required to generate this token. The roles object should contain information for each role for the transaction in which this token will be used. The PAYER and LABEL_OWNER roles are required to pay for any label transaction. The available roles are:
  * PAYER - This role is used to specify who will pay for the transaction. When using the PAYER role, the PaymentAccount and CRID must be specified.
  * RATE_HOLDER - This role is used to specify whose rates will be used in the transaction. When using the RATE_HOLDER role, the PaymentAccount and CRID must be specified.
  * LABEL_OWNER - This role is used to specify whose label ranges will be used in the transaction. When using the LABEL_OWNER role, the CRID, MID and Manifest MID must be specified.
  * SHIPPER - This role is used to specify who is entering the packages into the mailstream. When using SHIPPER role, the CRID must be specified.
  * MAIL_OWNER - This role is used to specify who owns the package contents. When using the MAIL_OWNER role, the CRID must be specified.  This does not populate the mail owner field in the D1 record of the Shipping Service File (SSF).  Please use the `packageDescription.mailerOwnerMID` field to populate the D1 field.
  * PLATFORM - This role is used to specify the platform used to make the API calls. When using the PLATFORM role, the CRID must be specified.
  * RETURN_LABEL_PAYER - This role is used to specify who will pay for the return label transaction. Optional if outbound and return label payer are the same. When using the RETURN_LABEL_PAYER role, the PaymentAccount and CRID must be specified.
  * RETURN_LABEL_RATE_HOLDER - This role is used to specify the owner of the Contracted Postage Rates for the return label in a combined outbound/return request. Optional if outbound and return label rate holder are the same. When using the RETURN_LABEL_RATE_HOLDER role, the MID must be specified.
  * RETURN_LABEL_OWNER - This role is used to specify whose label ranges will be used in the return label in a combined outbound/return request. Optional if outbound and return label owner are the same. When using the LABEL_OWNER role, the CRID, MID and Manifest MID must be specified.
  """
  @spec post_payments_payment_authorization(UspsEx.Payments.Parties.t(), keyword) ::
          {:ok, UspsEx.Payments.Parties.t()} | {:error, UspsEx.Payments.ErrorMessage.t()}
  def post_payments_payment_authorization(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {UspsEx.Payments.Resources, :post_payments_payment_authorization},
      url: "/payment-authorization",
      body: body,
      method: :post,
      request: [
        {"application/json", {UspsEx.Payments.Parties, :t}},
        {"application/xml", {UspsEx.Payments.Parties, :t}}
      ],
      response: [
        {200, {UspsEx.Payments.Parties, :t}},
        {400, {UspsEx.Payments.ErrorMessage, :t}},
        {401, {UspsEx.Payments.ErrorMessage, :t}},
        {403, {UspsEx.Payments.ErrorMessage, :t}},
        {429, {UspsEx.Payments.ErrorMessage, :t}},
        {503, {UspsEx.Payments.ErrorMessage, :t}},
        default: :null
      ],
      opts: opts
    })
  end
end
