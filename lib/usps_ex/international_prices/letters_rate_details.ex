defmodule UspsEx.InternationalPrices.LettersRateDetails do
  @moduledoc """
  Provides struct and type for a LettersRateDetails
  """

  @type t :: %__MODULE__{
          SKU: String.t() | nil,
          description: String.t() | nil,
          endDate: Date.t() | nil,
          extraServices: [[UspsEx.InternationalPrices.ExtraServiceRateDetailsInner.t()]] | nil,
          fees: [UspsEx.InternationalPrices.LettersRateDetailsFees.t()] | nil,
          mailClass: String.t() | nil,
          price: number | nil,
          priceType: String.t() | nil,
          startDate: Date.t() | nil,
          warnings: [String.t()] | nil,
          weight: number | nil
        }

  defstruct [
    :SKU,
    :description,
    :endDate,
    :extraServices,
    :fees,
    :mailClass,
    :price,
    :priceType,
    :startDate,
    :warnings,
    :weight
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      SKU: {:string, :generic},
      description: {:string, :generic},
      endDate: {:string, :date},
      extraServices: [[{UspsEx.InternationalPrices.ExtraServiceRateDetailsInner, :t}]],
      fees: [{UspsEx.InternationalPrices.LettersRateDetailsFees, :t}],
      mailClass: {:const, "FIRST-CLASS_MAIL"},
      price: :number,
      priceType: {:const, "RETAIL"},
      startDate: {:string, :date},
      warnings: [string: :generic],
      weight: :number
    ]
  end
end
