defmodule UspsEx.Address.CityState.Response do
  @moduledoc """
  Provides struct and type for a CityStateResponse
  """

  @type t :: %__MODULE__{
          ZIPCode: String.t() | nil,
          city: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [:ZIPCode, :city, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ZIPCode: {:string, :generic}, city: {:string, :generic}, state: {:string, :generic}]
  end
end
