defmodule UspsEx.Locations.ErrorMessageError do
  @moduledoc """
  Provides struct and type for a ErrorMessageError
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          errors: [UspsEx.Locations.ErrorMessageErrorErrors.t()] | nil,
          message: String.t() | nil
        }

  defstruct [:code, :errors, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      errors: [{UspsEx.Locations.ErrorMessageErrorErrors, :t}],
      message: {:string, :generic}
    ]
  end
end
