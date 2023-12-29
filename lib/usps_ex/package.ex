defmodule UspsEx.Package do
  @moduledoc """
  Defines the struct for storing a `Package`, which is then passed along with
  an origin and destination address for shipping estimates. A `description` is
  optional, as it may or may not be used with various carriers.

  For USPS, a package has a `container` string which can be one of the
  pre-defined USPS containers.

  Do not pass a `weight` parameter. Instead, pass in a list of `:items` with a
  weight parameter on each of these. The weight on the package will be the sum
  of the weights of each of these. Same for `:monetary_value`.

  `:description` can optionally be passed in. Otherwise, it will be generated
  by joining the descriptions of each of the items.

      UspsEx.Package.package(%{length: 8,
                                width: 8,
                                height: 8,
                                items: [
                                  %{weight: 1, monetary_value: 100, description: "A"},
                                  %{weight: 2, monetary_value: 200, description: "B"}
                                ]})

      # => %Package{weight: 3, monetary_value: 300, description: "A, B", ...}
  """

  alias UspsEx.Item

  @enforce_keys [:length, :width, :height, :weight, :items, :monetary_value, :description]
  @fields ~w(length width height weight girth container insurance monetary_value description items distance_unit mass_unit meta extra pricing_and_availability)a
  defstruct @fields

  @type t() :: %__MODULE__{
          length: number(),
          width: number(),
          height: number(),
          weight: number(),
          distance_unit: atom(),
          mass_unit: atom(),
          monetary_value: number(),
          girth: nil | number(),
          meta: nil | String.t(),
          extra: nil | String.t(),
          container: nil | atom() | String.t(),
          insurance: nil | Map.t(),
          description: nil | String.t(),
          items: [Item.t()]
        }

  @doc """
  Builds and returns a `Package`. Use this instead of directly initializing
  the struct.
  """
  @spec new(map()) :: t()
  def new(attrs) do
    items =
      case attrs do
        %{items: [_ | _] = items} -> Enum.map(items, &Item.new/1)
        _ -> []
      end

    weight =
      items
      |> Enum.filter(&is_number(&1.weight))
      |> Enum.reduce(0, &(&1.weight + &2))

    monetary_value =
      items
      |> Enum.filter(&is_number(&1.monetary_value))
      |> Enum.reduce(0, &(&1.monetary_value + &2))

    description =
      case attrs do
        %{description: d} when is_binary(d) and d != "" ->
          d

        _ ->
          items
          |> Enum.filter(&is_binary(&1.description))
          |> Enum.map(&String.normalize(&1.description, :nfc))
          |> Enum.join(", ")
      end

    mass_unit = :oz
    distance_unit = :in

    attrs =
      attrs
      |> Map.merge(%{
        items: items,
        weight: weight,
        monetary_value: monetary_value,
        description: description,
        mass_unit: mass_unit,
        distance_unit: distance_unit
      })
      |> Map.take(@fields)

    struct(__MODULE__, attrs)
  end
end

defmodule UspsEx.Package.Extras do
  defstruct cod: nil,
            insurance: nil,
            pricing_and_availability: nil
end

defmodule UspsEx.Package.Extras.Cod do
  defstruct amount: nil,
            currency: nil,
            payment_method: nil
end

defmodule UspsEx.Package.Extras.Insurance do
  defstruct amount: nil,
            currency: nil,
            content: nil,
            provider: nil
end
