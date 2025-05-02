defmodule UspsEx.Address.Response do
  @moduledoc """
  Provides struct and type for a AddressResponse
  """

  @type t :: %__MODULE__{
          additionalInfo: UspsEx.Address.AdditionalInfo.t() | nil,
          address: UspsEx.Domestic.Address.t() | nil,
          corrections: [UspsEx.Address.Corrections.t()] | nil,
          firm: String.t() | nil,
          matches: [UspsEx.Address.Matches.t()] | nil,
          warnings: [String.t()] | nil
        }

  defstruct [:additionalInfo, :address, :corrections, :firm, :matches, :warnings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      additionalInfo: {UspsEx.Address.AdditionalInfo, :t},
      address: {UspsEx.Address.Domestic, :t},
      corrections: [{UspsEx.Address.Corrections, :t}],
      firm: {:string, :generic},
      matches: [{UspsEx.Address.Matches, :t}],
      warnings: [string: :generic]
    ]
  end
end
