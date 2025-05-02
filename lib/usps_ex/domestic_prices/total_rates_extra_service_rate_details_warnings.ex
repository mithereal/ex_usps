defmodule UspsEx.DomesticPrices.TotalRatesExtraServiceRateDetailsWarnings do
  @moduledoc """
  Provides struct and type for a TotalRatesExtraServiceRateDetailsWarnings
  """

  @type t :: %__MODULE__{warningCode: String.t() | nil, warningDescription: String.t() | nil}

  defstruct [:warningCode, :warningDescription]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [warningCode: {:string, :generic}, warningDescription: {:string, :generic}]
  end
end
