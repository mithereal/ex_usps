defmodule UspsEx.Locations.PaginationMetadata do
  @moduledoc """
  Provides struct and type for a PaginationMetadata
  """

  @type t :: %__MODULE__{
          limit: integer,
          links: [UspsEx.Locations.Links.t()] | nil,
          offset: integer,
          page: integer | nil,
          totalCount: integer | nil,
          totalPages: integer | nil
        }

  defstruct [:limit, :links, :offset, :page, :totalCount, :totalPages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      limit: :integer,
      links: [{UspsEx.Locations.Links, :t}],
      offset: :integer,
      page: :integer,
      totalCount: :integer,
      totalPages: :integer
    ]
  end
end
