defmodule UspsEx.Address.Corrections do
  @moduledoc """
  Provides struct and type for a AddressCorrections
  """

  @type t :: %__MODULE__{code: String.t() | nil, text: String.t() | nil}

  defstruct [:code, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: {:string, :generic}, text: {:string, :generic}]
  end
end
