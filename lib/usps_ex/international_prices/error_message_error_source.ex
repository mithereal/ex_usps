defmodule UspsEx.InternationalPrices.ErrorMessageErrorSource do
  @moduledoc """
  Provides struct and type for a ErrorMessageErrorSource
  """

  @type t :: %__MODULE__{example: String.t() | nil, parameter: String.t() | nil}

  defstruct [:example, :parameter]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [example: {:string, :generic}, parameter: {:string, :generic}]
  end
end
