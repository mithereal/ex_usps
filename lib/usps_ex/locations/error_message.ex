defmodule UspsEx.Locations.ErrorMessage do
  @moduledoc """
  Provides struct and type for a ErrorMessage
  """

  @type t :: %__MODULE__{
          apiVersion: String.t() | nil,
          error: UspsEx.Locations.ErrorMessageError.t() | nil
        }

  defstruct [:apiVersion, :error]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [apiVersion: {:string, :generic}, error: {UspsEx.Locations.ErrorMessageError, :t}]
  end
end
