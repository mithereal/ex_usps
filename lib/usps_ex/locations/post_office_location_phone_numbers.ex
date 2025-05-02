defmodule UspsEx.Locations.PostOfficeLocationPhoneNumbers do
  @moduledoc """
  Provides struct and type for a PostOfficeLocationPhoneNumbers
  """

  @type t :: %__MODULE__{fax: String.t() | nil, phone: String.t() | nil}

  defstruct [:fax, :phone]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fax: {:string, :generic}, phone: {:string, :generic}]
  end
end
