defmodule UspsEx.DomesticPrices.LetterRatesQueryNonMachinableIndicators do
  @moduledoc """
  Provides struct and type for a LetterRatesQueryNonMachinableIndicators
  """

  @type t :: %__MODULE__{
          hasClosureDevices: boolean | nil,
          hasLooseItems: boolean | nil,
          isBooklet: boolean | nil,
          isPolybagged: boolean | nil,
          isRigid: boolean | nil,
          isSelfMailer: boolean | nil
        }

  defstruct [
    :hasClosureDevices,
    :hasLooseItems,
    :isBooklet,
    :isPolybagged,
    :isRigid,
    :isSelfMailer
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      hasClosureDevices: :boolean,
      hasLooseItems: :boolean,
      isBooklet: :boolean,
      isPolybagged: :boolean,
      isRigid: :boolean,
      isSelfMailer: :boolean
    ]
  end
end
