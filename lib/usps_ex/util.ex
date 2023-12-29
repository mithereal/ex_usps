defmodule UspsEx.Util do
  @moduledoc """
  Utils for `UspsEx`.
  """

  @default_container :rectangular
  @large_containers ~w(rectangular nonrectangular variable)a

  @doc """
  Takes a price and multiplies it by 100. Accepts nil, floats, integers, and
  strings.

      iex> Util.price_to_cents(nil)
      0
      iex> Util.price_to_cents(0)
      0
      iex> Util.price_to_cents(28.00)
      2800
      iex> Util.price_to_cents("28.00")
      2800
      iex> Util.price_to_cents("28")
      2800
      iex> Util.price_to_cents(28)
      2800
  """
  @spec price_to_cents(nil | number() | String.t()) :: integer
  def price_to_cents(string) when is_binary(string) do
    {float, _} = Float.parse(string)
    price_to_cents(float)
  end

  def price_to_cents(nil), do: 0
  def price_to_cents(float) when is_float(float), do: Float.floor(float * 100) |> round
  def price_to_cents(integer) when is_integer(integer), do: integer * 100

  @doc """
  Takes a price and divides it by 100, returning a string representation. This
  is used for API calls that require dollars instead of cents. Unlike
  `price_to_cents`, this only accepts integers and nil. Otherwise, it will
  raise an exception.

      iex> Util.price_to_dollars(nil)
      "0.00"
      iex> Util.price_to_dollars(200_00)
      "200"
      iex> Util.price_to_dollars("20000")
      ** (FunctionClauseError) no function clause matching in UspsEx.Util.price_to_dollars/1
  """
  @spec price_to_dollars(integer) :: String.t() | none()
  def price_to_dollars(nil), do: "0.00"

  def price_to_dollars(integer) when is_integer(integer) do
    dollars = Integer.floor_div(integer, 100)
    cents = rem(integer, 100)
    s = "#{dollars}"

    cond do
      cents == 0 ->
        s

      cents < 10 ->
        "#{s}.0#{cents}"

      true ->
        "#{s}.#{cents}"
    end
  end

  @doc """
  Converts pounds to kilograms.

      iex> Util.lbs_to_kgs(10)
      4.5
      iex> Util.lbs_to_kgs(0)
      0.0
  """
  @spec lbs_to_kgs(number()) :: float()
  def lbs_to_kgs(lbs) do
    Float.round(lbs * 0.453592, 1)
  end

  @doc """
  Converts kilograms to pounds.

      iex> Util.kgs_to_lbs(10)
      22.0
      iex> Util.kgs_to_lbs(0)
      0.0
  """
  @spec kgs_to_lbs(number()) :: float()
  def kgs_to_lbs(kgs) do
    Float.round(kgs * 2.20462, 1)
  end

  @doc """
  Converts inches to centimeters.

      iex> Util.inches_to_cm(10)
      25.4
      iex> Util.inches_to_cm(0)
      0.0
  """
  @spec inches_to_cm(number()) :: float()
  def inches_to_cm(inches) do
    Float.round(inches * 2.54, 1)
  end

  @doc """
  Converts centimeters to inches.

      iex> Util.cm_to_inches(10)
      3.9
      iex> Util.cm_to_inches(0)
      0.0
  """
  @spec cm_to_inches(number()) :: float()
  def cm_to_inches(cm) do
    Float.round(cm * 0.393701, 1)
  end

  @doc """
  Removes accents/ligatures from letters.

      iex> Util.unaccent("Curaçao")
      "Curacao"
      iex> Util.unaccent("Republic of Foo (the)")
      "Republic of Foo (the)"
      iex> Util.unaccent("Åland Islands")
      "Aland Islands"
  """
  @spec unaccent(String.t()) :: String.t()
  def unaccent(string) do
    diacritics = Regex.compile!("[\u0300-\u036f]")

    string
    |> String.normalize(:nfd)
    |> String.replace(diacritics, "")
  end

  @doc ~S"""
  Returns `true` for `nil`, empty strings, and strings only containing
  whitespace. Returns `false` otherwise.

      iex> Util.blank?(nil)
      true
      iex> Util.blank?("")
      true
      iex> Util.blank?("   ")
      true
      iex> Util.blank?(" \t\r\n ")
      true
      iex> Util.blank?("Test")
      false
      iex> Util.blank?(100)
      false
  """
  @spec blank?(term()) :: boolean()
  def blank?(nil), do: true
  def blank?(""), do: true
  def blank?(s) when is_binary(s), do: String.trim(s) == ""
  def blank?(_), do: false

  @doc """
  Returns the given map with keys converted to strings, and the values trimmed
  (if the values are also strings).

      iex> Util.stringify_and_trim(%{foo: "  bar  "})
      %{"foo" => "bar"}
  """
  @spec stringify_and_trim(map()) :: map()
  def stringify_and_trim(params) do
    for {key, val} <- params, into: %{} do
      key =
        cond do
          is_atom(key) -> Atom.to_string(key)
          true -> key
        end

      val =
        cond do
          is_binary(val) -> String.trim(val)
          true -> val
        end

      {key, val}
    end
  end

  @not_serviced ~w(AN AQ BV CU EH FK GS HM IO KP LA MM PM PN PS SJ SO SS SY TF TJ TM UM WS YE YU)
  def services_country?(country) when country in @not_serviced do
    false
  end

  def services_country?(_country) do
    true
  end

  def domestic?("US"), do: true
  def domestic?(country) when country in ~w(AS FM GU MH MP PR PW UM VI), do: true
  def domestic?(_), do: false

  def international?(country),
    do: not domestic?(country)

  def country(%{country: code}) do
    country(code)
  end

  def country("AX"), do: "Aland Island"
  def country("BA"), do: "Bosnia-Herzegovina"
  def country("BQ"), do: "Bonaire"
  def country("CC"), do: "Cocos Island"
  def country("CI"), do: "Ivory Coast"
  def country("CV"), do: "Cape Verde"
  def country("CZ"), do: "Czech Republic"
  def country("KR"), do: "South Korea"
  def country("KP"), do: "North Korea"
  def country("MM"), do: "Burma"
  def country("RU"), do: "Russia"
  def country("SH"), do: "Saint Helena"
  def country("SY"), do: "Syria"
  def country("VA"), do: "Vatican City"
  def country("TZ"), do: "Tanzania"
  def country("WF"), do: "Wallis and Futuna Islands"

  def country(code) do
    ISO.country_name(code, :informal)
  end

  def state_without_country(%{state: state, country: country}) do
    String.replace(state, "#{country}-", "")
  end

  def create_hash(string, min_len \\ 5) do
    case string do
      nil -> Nanoid.generate(min_len)
      _ -> Nanoid.generate(min_len, string)
    end
  end

  def weight_in_ounces(data, weight_unit \\ :lbs) do
    16 *
      case weight_unit do
        :lbs ->
          data

        :kg ->
          kgs_to_lbs(data)

        u ->
          {:error, "Invalid unit of measurement specified: #{u}"}
      end
  end

  def size(package) do
    is_large? =
      cond do
        container(package) == "RECTANGULAR" ->
          true

        package.container in @large_containers ->
          package
          |> Map.take(~w(large width height)a)
          |> Map.values()
          |> Enum.any?(&(&1 > 12))

        true ->
          false
      end

    if is_large?, do: "LARGE", else: "REGULAR"
  end

  def strip_html(string) do
    string
    |> HtmlEntities.decode()
    |> String.replace(~r/<\/?\w+>.*<\/\w+>/, "")
  end

  def flat_rate_containers() do
    %{
      envelope: %{name: "Flat Rate Envelope", rate: 665, length: 12.5, height: 9.5, width: 0},
      envelope_gift_card: %{
        name: "Gift Card Flat Rate Envelope",
        rate: 665,
        length: 10,
        height: 7,
        width: 0
      },
      envelope_window: %{
        name: "Window Flat Rate Envelope",
        rate: 665,
        length: 10,
        height: 5,
        width: 0
      },
      envelope_small: %{name: "Sm Flat Rate Envelope", rate: 665, length: 10, height: 6, width: 0},
      envelope_legal: %{
        name: "Legal Flat Rate Envelope",
        rate: 695,
        length: 15,
        height: 9.5,
        width: 0
      },
      envelope_padded: %{
        name: "Padded Flat Rate Envelope",
        rate: 720,
        length: 12.5,
        height: 9.5,
        width: 0
      },
      box_small: %{
        name: "Sm Flat Rate Box",
        rate: 715,
        length: 8.6875,
        height: 5.4375,
        width: 1.75
      },
      box_medium: %{name: "Md Flat Rate Box", rate: 1360, length: 11.25, height: 8.75, width: 6},
      box_large: %{name: "Lg Flat Rate Box", rate: 1885, length: 12.25, height: 12.25, width: 6}
    }
  end

  def containers() do
    %{
      box_large: "Lg Flat Rate Box",
      box_medium: "Md Flat Rate Box",
      box_small: "Sm Flat Rate Box",
      envelope: "Flat Rate Envelope",
      envelope_gift_card: "Gift Card Flat Rate Envelope",
      envelope_legal: "Legal Flat Rate Envelope",
      envelope_padded: "Padded Flat Rate Envelope",
      envelope_small: "Sm Flat Rate Envelope",
      envelope_window: "Window Flat Rate Envelope",
      nonrectangular: "Nonrectangular",
      rectangular: "Rectangular",
      variable: "Variable"
    }
  end

  def container(package) do
    case containers()[package.container] do
      nil -> containers()[@default_container]
      container -> container
    end
    |> String.upcase()
  end
end
