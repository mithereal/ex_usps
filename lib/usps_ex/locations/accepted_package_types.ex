defmodule UspsEx.Locations.AcceptedPackageTypes do
  @moduledoc """
  Provides struct and type for a AcceptedPackageTypes
  """

  @type t :: %__MODULE__{
          mailClass: String.t() | nil,
          palletized: String.t() | nil,
          processingCategory: String.t() | nil
        }

  defstruct [:mailClass, :palletized, :processingCategory]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      mailClass:
        {:enum,
         [
           "PARCEL_SELECT",
           "PARCEL_SELECT_LIGHTWEIGHT",
           "USPS_CONNECT_LOCAL",
           "USPS_CONNECT_MAIL",
           "USPS_CONNECT_REGIONAL",
           "LIBRARY_MAIL",
           "MEDIA_MAIL",
           "BOUND_PRINTED_MATTER"
         ]},
      palletized: {:enum, ["PALLETIZED", "NON_PALLETIZED", "BOTH"]},
      processingCategory:
        {:enum, ["FLATS", "MACHINABLE", "IRREGULAR", "NON_MACHINABLE", "NONSTANDARD"]}
    ]
  end
end
