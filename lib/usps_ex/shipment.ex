defmodule UspsEx.Shipment do
  @moduledoc """
  A `Shipment` represents everything needed to fetch rates from carriers: an
  origin, a destination, and a list of packages. An optional `:id` field
  is provided in the struct, which may be used by the end user to represent the
  user's internal identifier for the shipment. The id is not used by UspsEx.

  Shipments are created by `shipment/3`.
  """

  @blocked_countries [:cu, :ir, :kp, :sl, :ps, :ss, :ua, :gh, :kg, :kz, :ng]
  @high_risk_countries [:ci, :cd, :lr, :lb, :sy, :by, :iq, :zw, :sy]

  alias UspsEx.Shipment

  @enforce_keys [:from, :to, :ship_date, :packages]
  defstruct [
    :id,
    :from,
    :to,
    :ship_date,
    :packages
  ]

  @doc """
  Builds a `Shipment`.
  """
  def new(from, to, packages \\ [], opts \\ []) do
    ship_date = Keyword.get(opts, :ship_date)
    allow_high_risk = Keyword.get(opts, :high_risk)

    if from.country != "US" do
      throw({:error, "UspsEx does not yet support shipments originating outside of the US."})
    end

    if Enum.member?(@blocked_countries, String.to_atom(String.downcase(to.country))) do
      throw({:error, "Usps does not support shipments to #{to.country}."})
    end

    if allow_high_risk = nil do
      if Enum.member?(@high_risk_countries, String.to_atom(String.downcase(to.country))) do
        throw(
          {:error,
           "Usps flags #{to.country} as high risk, you must pass [high_risk: true] ex. UspsEx.Shipment.new(from, to, packages, [high_risk: true]) ."}
        )
      end
    end

    if not (is_nil(ship_date) or match?(%Date{}, ship_date)) do
      throw({:error, "Invalid ship date: #{ship_date}"})
    end

    shipment = %Shipment{
      from: from,
      to: to,
      packages: packages,
      ship_date: ship_date
    }

    {:ok, shipment}
  catch
    {:error, _} = e -> e
  end

  @doc """
  Builds a `Shipment`. Raises on failure.
  """
  def new!(from, to, [] = packages, opts \\ []) do
    case new(from, to, packages, opts) do
      {:ok, shipment} -> shipment
      {:error, error} -> raise error
    end
  end
end
