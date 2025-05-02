defmodule UspsEx.DomesticPrices.ExtraServiceRateDetails do
  @moduledoc """
  Provides struct and type for a ExtraServiceRateDetails
  """

  @type t :: %__MODULE__{
          SKU: String.t() | nil,
          extraService: String.t() | nil,
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
      extraService: {:string, :generic},
      name: {:string, :generic},
      price: :number,
      priceType: {:enum, ["RETAIL", "COMMERCIAL", "CONTRACT", "NSA"]},
      warnings: [string: :generic]
    ]
  end
end
