defmodule UspsEx.Locations.PostOfficeLocationServices do
  @moduledoc """
  Provides struct and type for a PostOfficeLocationServices
  """

  @type t :: %__MODULE__{
          additionalInformation:
            UspsEx.Locations.PostOfficeLocationServicesAdditionalInformation.t() | nil,
          hours: [UspsEx.Locations.HoursOfOperation.t()] | nil,
          service: String.t() | nil
        }

  defstruct [:additionalInformation, :hours, :service]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      additionalInformation:
        {UspsEx.Locations.PostOfficeLocationServicesAdditionalInformation, :t},
      hours: [{UspsEx.Locations.HoursOfOperation, :t}],
      service: {:string, :generic}
    ]
  end
end
