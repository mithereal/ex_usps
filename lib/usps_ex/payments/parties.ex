defmodule UspsEx.Payments.Parties do
  @moduledoc """
  Provides struct and type for a Parties
  """

  @type t :: %__MODULE__{
          paymentAuthorizationToken: String.t() | nil,
          roles: [UspsEx.Payments.Role.t()] | nil
        }

  defstruct [:paymentAuthorizationToken, :roles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [paymentAuthorizationToken: {:string, :generic}, roles: [{UspsEx.Payments.Role, :t}]]
  end
end
