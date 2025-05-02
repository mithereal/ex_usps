defmodule UspsEx.InternationalPrices.LettersRateDetailsFees do
  @moduledoc """
  Provides struct and type for a LettersRateDetailsFees
  """

  @type t :: %__MODULE__{SKU: String.t() | nil, name: String.t() | nil, price: number | nil}

  defstruct [:SKU, :name, :price]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [SKU: {:string, :generic}, name: {:string, :generic}, price: :number]
  end
end
