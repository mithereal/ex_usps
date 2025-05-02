defmodule UspsEx.InternationalPrices.InternationalRateListQueryResult do
  @moduledoc """
  Provides struct and type for a InternationalRateListQueryResult
  """

  @type t :: %__MODULE__{rateOptions: [UspsEx.InternationalPrices.RateOption.t()] | nil}

  defstruct [:rateOptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rateOptions: [{UspsEx.InternationalPrices.RateOption, :t}]]
  end
end
