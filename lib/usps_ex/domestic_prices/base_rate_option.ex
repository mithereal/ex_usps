defmodule UspsEx.DomesticPrices.BaseRateOption do
  @moduledoc """
  Provides struct and type for a BaseRateOption
  """

  @type t :: %__MODULE__{
          rates: [UspsEx.DomesticPrices.BaseRateDetails.t()] | nil,
          totalBasePrice: number | nil
        }

  defstruct [:rates, :totalBasePrice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rates: [{UspsEx.DomesticPrices.BaseRateDetails, :t}], totalBasePrice: :number]
  end
end
