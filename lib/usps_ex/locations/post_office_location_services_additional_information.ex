defmodule UspsEx.Locations.PostOfficeLocationServicesAdditionalInformation do
  @moduledoc """
  Provides struct and type for a PostOfficeLocationServicesAdditionalInformation
  """

  @type t :: %__MODULE__{mailClasses: [String.t()] | nil}

  defstruct [:mailClasses]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mailClasses: [string: :generic]]
  end
end
