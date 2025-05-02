defmodule UspsEx.DomesticPrices.BaseRatesQueryResult do
  @moduledoc """
  Provides struct and type for a BaseRatesQueryResult
  """

  @type t :: %__MODULE__{rateOptions: [UspsEx.DomesticPrices.RateOption.t()] | nil}

  defstruct [:rateOptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rateOptions: [{UspsEx.DomesticPrices.RateOption, :t}]]
  end
end
