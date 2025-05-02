defmodule UspsEx.DomesticPrices.LetterRatesOption do
  @moduledoc """
  Provides struct and type for a LetterRatesOption
  """

  @type t :: %__MODULE__{
          rates: [UspsEx.DomesticPrices.LettersRateDetails.t()] | nil,
          totalBasePrice: number | nil
        }

  defstruct [:rates, :totalBasePrice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rates: [{UspsEx.DomesticPrices.LettersRateDetails, :t}], totalBasePrice: :number]
  end
end
