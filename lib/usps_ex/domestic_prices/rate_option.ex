defmodule UspsEx.DomesticPrices.RateOption do
  @moduledoc """
  Provides struct and type for a RateOption
  """

  @type t :: %__MODULE__{
          rates: [UspsEx.DomesticPrices.RateDetails.t()] | nil,
          totalBasePrice: number | nil
        }

  defstruct [:rates, :totalBasePrice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rates: [{UspsEx.DomesticPrices.RateDetails, :t}], totalBasePrice: :number]
  end
end
