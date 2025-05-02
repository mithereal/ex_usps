defmodule UspsEx.InternationalPrices.ErrorMessageErrorErrors do
  @moduledoc """
  Provides struct and type for a ErrorMessageErrorErrors
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          detail: String.t() | nil,
          source: UspsEx.InternationalPrices.ErrorMessageErrorSource.t() | nil,
          status: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:code, :detail, :source, :status, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      detail: {:string, :generic},
      source: {UspsEx.InternationalPrices.ErrorMessageErrorSource, :t},
      status: {:string, :generic},
      title: {:string, :generic}
    ]
  end
end
