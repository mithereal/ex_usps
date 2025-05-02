defmodule UspsEx.CarrierPickup.SMSNotification do
  @moduledoc """
  Provides struct and type for a SMSNotification
  """

  @type t :: %__MODULE__{cellNumber: String.t() | nil}

  defstruct [:cellNumber]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cellNumber: {:string, :generic}]
  end
end
