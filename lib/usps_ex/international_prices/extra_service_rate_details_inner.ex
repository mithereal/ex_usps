defmodule UspsEx.InternationalPrices.ExtraServiceRateDetailsInner do
  @moduledoc """
  Provides struct and type for a ExtraServiceRateDetailsInner
  """

  @type t :: %__MODULE__{
          SKU: String.t() | nil,
          extraService: 813 | 820 | 826 | 857 | 930 | 931 | 955 | nil,
          name: String.t() | nil,
          price: number | nil,
          priceType: String.t() | nil,
          warnings: [String.t()] | nil
        }

  defstruct [:SKU, :extraService, :name, :price, :priceType, :warnings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      SKU: {:string, :generic},
      extraService: {:enum, [813, 820, 826, 857, 930, 931, 955]},
      name: {:string, :generic},
      price: :number,
      priceType:
        {:enum, ["RETAIL", "COMMERCIAL", "COMMERCIAL_BASE", "COMMERCIAL_PLUS", "CONTRACT"]},
      warnings: [string: :generic]
    ]
  end
end
