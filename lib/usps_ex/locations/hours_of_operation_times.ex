defmodule UspsEx.Locations.HoursOfOperationTimes do
  @moduledoc """
  Provides struct and type for a HoursOfOperationTimes
  """

  @type t :: %__MODULE__{closeTime: String.t() | nil, openTime: String.t() | nil}

  defstruct [:closeTime, :openTime]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [closeTime: {:string, :generic}, openTime: {:string, :generic}]
  end
end
