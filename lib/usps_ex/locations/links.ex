defmodule UspsEx.Locations.Links do
  @moduledoc """
  Provides struct and type for a Links
  """

  @type t :: %__MODULE__{
          href: String.t(),
          method: String.t() | nil,
          rel: [String.t()],
          submissionMediaType: String.t() | nil,
          targetMediaType: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:href, :method, :rel, :submissionMediaType, :targetMediaType, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      href: {:string, :uri},
      method: {:enum, ["GET", "POST", "PUT", "DELETE"]},
      rel: [string: :generic],
      submissionMediaType: {:string, :generic},
      targetMediaType: {:string, :generic},
      title: {:string, :generic}
    ]
  end
end
