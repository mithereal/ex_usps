defmodule UspsEx.InternationalPrices.RateOption do
  @moduledoc """
  Provides struct and type for a RateOption
  """

  @type t :: %__MODULE__{
          rates: [UspsEx.InternationalPrices.RateDetails.t()] | nil,
          totalBasePrice: number | nil
        }

  defstruct [:rates, :totalBasePrice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rates: [{UspsEx.InternationalPrices.RateDetails, :t}], totalBasePrice: :number]
  end
end
