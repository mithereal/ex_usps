defmodule UspsEx.Address.AdditionalInfo do
  @moduledoc """
  Provides struct and type for a AddressAdditionalInfo
  """

  @type t :: %__MODULE__{
          DPVCMRA: String.t() | nil,
          DPVConfirmation: String.t() | nil,
          business: String.t() | nil,
          carrierRoute: String.t() | nil,
          centralDeliveryPoint: String.t() | nil,
          deliveryPoint: String.t() | nil,
          vacant: String.t() | nil
        }

  defstruct [
    :DPVCMRA,
    :DPVConfirmation,
    :business,
    :carrierRoute,
    :centralDeliveryPoint,
    :deliveryPoint,
    :vacant
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      DPVCMRA: {:enum, ["Y", "N"]},
      DPVConfirmation: {:enum, ["Y", "D", "S", "N"]},
      business: {:enum, ["Y", "N"]},
      carrierRoute: {:string, :generic},
      centralDeliveryPoint: {:enum, ["Y", "N"]},
      deliveryPoint: {:string, :generic},
      vacant: {:enum, ["Y", "N"]}
    ]
  end
end
