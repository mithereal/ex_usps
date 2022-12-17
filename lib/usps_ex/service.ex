defmodule UspsEx.Service do
  @moduledoc """
  A `Service` represents a  shipping option.

  Service fields are:

    * `:id`          - A unique UspsEx ID that can be used to perform lookusps or fetch rates
    * `:description` - A user-friendly string containing the name of the service

  ## Example

        iex> UspsEx.Service.services_for_carrier(:usps)
        [
          %UspsEx.Service{id: :usps_next_day_air,  description: "USPS Next Day Air"},
          %UspsEx.Service{id: :usps_second_day_air, description: "USPS 2nd Day Air"},
          %UspsEx.Service{id: :usps_three_day_select,  description: "USPS 3 Day Select"},
          %UspsEx.Service{id: :usps_ground,  description: "USPS Ground"}
        ]
  """

  alias __MODULE__, as: S
  alias UspsEx.Shipment

  @enforce_keys [:id, :description]
  defstruct [:id, :description]

  @type t() :: %__MODULE__{
          id: atom(),
          description: String.t()
        }

  @doc """
  Looks up a shipping service by its unique UspsEx ID. Returns nil if none
  exist.

      iex> Service.get(:usps_priority)
      %Service{id: :usps_priority,  description: "Priority Mail"}
      iex> Service.get(:invalid_service)
      nil
  """
  @compile {:inline, get: 1}
  @spec get(atom) :: t | nil
  def get(:usps_ground), do: %S{id: :usps_ground, description: "USPS Ground"}

  def get(:usps_next_day_air),
    do: %S{id: :usps_next_day_air, description: "USPS Next Day Air"}

  def get(:usps_second_day_air),
    do: %S{id: :usps_second_day_air, description: "USPS 2nd Day Air"}

  def get(:usps_three_day_select),
    do: %S{id: :usps_three_day_select, description: "USPS 3 Day Select"}

  def get(:usps_expedited), do: %S{id: :usps_expedited, description: "USPS Expedited"}

  def get(:usps_express_saver),
    do: %S{id: :usps_express_saver, description: "USPS Express Saver"}

  def get(:usps_express), do: %S{id: :usps_express, description: "USPS Express"}
  def get(:usps_standard), do: %S{id: :usps_standard, description: "USPS Standard"}

  def get(:usps_worldwide_saver),
    do: %S{id: :usps_worldwide_saver, description: "USPS Worldwide Saver"}

  def get(:usps_worldwide_expedited),
    do: %S{id: :usps_worldwide_expedited, description: "USPS Worldwide Expedited"}

  def get(:usps_worldwide_express),
    do: %S{id: :usps_worldwide_express, description: "USPS Worldwide Express"}

  def get(:usps_media), do: %S{id: :usps_media, description: "Media Mail Package"}

  def get(:usps_library),
    do: %S{id: :usps_library, description: "Library Mail Package"}

  def get(:usps_first_class),
    do: %S{id: :usps_first_class, description: "First-Class Mail Package"}

  def get(:usps_retail_ground),
    do: %S{id: :usps_retail_ground, description: "USPS Retail Ground"}

  def get(:usps_package_select),
    do: %S{id: :usps_package_select, description: "Package Select Ground"}

  def get(:usps_priority),
    do: %S{id: :usps_priority, description: "Priority Mail"}

  def get(:usps_priority_express),
    do: %S{id: :usps_priority_express, description: "Priority Mail Express"}

  def get(:usps_priority_international),
    do: %S{
      id: :usps_priority_international,
      description: "Priority Mail International"
    }

  def get(:usps_gxg), do: %S{id: :usps_gxg, description: "GXG"}
  def get(_service), do: nil

  @doc """
  Returns all services  based on the `shipment` provided.

      UspsEx.Service.services(%Shipment{})
  """
  def services(%Shipment{to: %{country: dst}}) do
    services_to_country(dst)
    |> Enum.map(&get/1)
    |> Enum.reject(&is_nil/1)
  end

  defp services_to_country("US") do
    ~w(usps_media usps_library usps_first_class usps_retail_ground usps_package_select usps_priority usps_priority_express)a
  end

  defp services_to_country(_country) do
    ~w(usps_first_class usps_priority usps_priority_express usps_gxg)a
  end

  defp services_to_country("US") do
    ~w(usps_ground usps_three_day_select usps_second_day_air usps_next_day_air)a
  end

  defp services_to_country(_country) do
    ~w(usps_standard usps_worldwide_expedited usps_worldwide_express usps_worldwide_saver)a
  end

  # Returns the service code used by the third-party API. Only used internally
  # for API requests.

  @doc false
  @compile {:inline, service_code: 1}
  @spec service_code(atom | t) :: String.t() | nil
  def service_code(%S{id: id}), do: service_code(id)
  def service_code(:usps_ground), do: "03"
  def service_code(:usps_next_day_air), do: "01"
  def service_code(:usps_second_day_air), do: "02"
  def service_code(:usps_three_day_select), do: "12"
  def service_code(:usps_expedited), do: "02"
  def service_code(:usps_express_saver), do: "13"
  def service_code(:usps_express), do: "01"
  def service_code(:usps_standard), do: "11"
  def service_code(:usps_worldwide_saver), do: "65"
  def service_code(:usps_worldwide_expedited), do: "08"
  def service_code(:usps_worldwide_express), do: "07"
  def service_code(:usps_media), do: "MEDIA MAIL"
  def service_code(:usps_library), do: "LIBRARY MAIL"
  def service_code(:usps_first_class), do: "FIRST CLASS"
  def service_code(:usps_retail_ground), do: "RETAIL GROUND"
  def service_code(:usps_package_select), do: "PARCEL SELECT GROUND"
  def service_code(:usps_priority), do: "PRIORITY"
  def service_code(:usps_priority_express), do: "PRIORITY EXPRESS"
  def service_code(:usps_priority_international), do: "PRIORITY INTERNATIONAL"
  def service_code(:usps_gxg), do: "GXG"
end
