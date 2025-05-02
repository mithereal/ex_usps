defmodule UspsEx.DomesticPrices.ErrorMessage do
  @moduledoc """
  Provides struct and type for a ErrorMessage
  """

  @type t :: %__MODULE__{
          apiVersion: String.t() | nil,
          error: UspsEx.DomesticPrices.ErrorMessageError.t() | nil
        }

  defstruct [:apiVersion, :error]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [apiVersion: {:string, :generic}, error: {UspsEx.DomesticPrices.ErrorMessageError, :t}]
  end
end
