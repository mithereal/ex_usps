defmodule UspsEx.Address.ZIPCode.Response do
  @moduledoc """
  Provides struct and type for a ZIPCodeResponse
  """

  @type t :: %__MODULE__{address: UspsEx.Address.Domestic.t() | nil, firm: String.t() | nil}

  defstruct [:address, :firm]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [address: {UspsEx.Address.Domestic, :t}, firm: {:string, :generic}]
  end
end
