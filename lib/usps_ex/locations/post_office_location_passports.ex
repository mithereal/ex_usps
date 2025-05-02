defmodule UspsEx.Locations.PostOfficeLocationPassports do
  @moduledoc """
  Provides struct and type for a PostOfficeLocationPassports
  """

  @type t :: %__MODULE__{
          appointmentRequired: boolean | nil,
          phone: String.t() | nil,
          photoCost: number | nil
        }

  defstruct [:appointmentRequired, :phone, :photoCost]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [appointmentRequired: :boolean, phone: {:string, :generic}, photoCost: :number]
  end
end
