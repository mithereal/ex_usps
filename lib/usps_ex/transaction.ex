defmodule UspsEx.Transaction do
  @moduledoc """
  Defines a struct that represents billable transactions with carriers.
  """

  alias UspsEx.{Transaction, Shipment, Rate, Label}

  @enforce_keys [:shipment, :rate, :label]
  defstruct [:shipment, :rate, :label]

  @type t() :: %__MODULE__{
          shipment: Shipment.t(),
          rate: Rate.t(),
          label: nil | Label.t(),
        }

  @doc false
  @spec new(Shipment.t(), Rate.t(), nil | Label.t()) :: Transaction.t()
  def new(%Shipment{} = shipment, %Rate{} = rate, label) do
    %Transaction{shipment: shipment, rate: rate, label: label}
  end
end
