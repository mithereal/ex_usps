defmodule UspsEx.Address.Domestic do
  @moduledoc """
  Provides struct and type for a DomesticAddress
  """

  @type t :: %__MODULE__{
          ZIPCode: String.t() | nil,
          ZIPPlus4: String.t() | nil,
          city: String.t() | nil,
          cityAbbreviation: String.t() | nil,
          secondaryAddress: String.t() | nil,
          state: String.t() | nil,
          streetAddress: String.t() | nil,
          streetAddressAbbreviation: String.t() | nil,
          urbanization: String.t() | nil
        }

  defstruct [
    :ZIPCode,
    :ZIPPlus4,
    :city,
    :cityAbbreviation,
    :secondaryAddress,
    :state,
    :streetAddress,
    :streetAddressAbbreviation,
    :urbanization
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ZIPCode: {:string, :generic},
      ZIPPlus4: {:string, :generic},
      city: {:string, :generic},
      cityAbbreviation: {:string, :generic},
      secondaryAddress: {:string, :generic},
      state: {:string, :generic},
      streetAddress: {:string, :generic},
      streetAddressAbbreviation: {:string, :generic},
      urbanization: {:string, :generic}
    ]
  end
end
