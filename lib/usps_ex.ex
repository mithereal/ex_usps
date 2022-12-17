defmodule UspsEx do
  @moduledoc """
  Documentation for `UspsEx`.
  """

  require EEx
  import SweetXml

  alias UspsEx.Error

  import UspsEx.Util,
    only: [
      state_without_country: 1,
      price_to_cents: 1,
      international?: 1,
      create_hash: 1,
      create_hash: 2,
      weight_in_ounces: 1,
      services_country?: 1,
      domestic?: 1,
      country: 1,
      containers: 0,
      flat_rate_containers: 0,
      container: 1,
      size: 1,
      strip_html: 1,
      price_to_dollars: 1
    ]

  alias UspsEx.Client
  alias UspsEx.Insurance
  alias UspsEx.Config
  alias UspsEx.InvalidConfigError
  alias UspsEx.Label
  alias UspsEx.Rate
  alias UspsEx.Service
  alias UspsEx.Parcel
  alias UspsEx.Util

  for f <-
        ~w(address cancel carrier_pickup_availability city_state_by_zipcode express_mail_commitments first_class_service_standards hold_for_pickup package_pickup_cancel package_pickup_change package_pickup_inquery package_pickup_schedule package_service_standardb priority_mail_service_standards proof_of_delivery return_label return_receipt label rate scan sdc_get_locations sunday_holiday track track_confirm_by_email track_fields validate_address zipcode)a do
    EEx.function_from_file(
      :defp,
      :"build_#{f}_request",
      __DIR__ <> "/usps_ex/requests/#{f}.eex",
      [
        :assigns
      ],
      trim: true
    )
  end

  defmacro with_response(response, do: block) do
    quote do
      case unquote(response) do
        {:ok, %{body: body}} ->
          case xpath(body, ~x"//Error//text()"s) do
            "" ->
              var!(body) = body
              unquote(block)

            error ->
              code = xpath(body, ~x"//Error//Number//text()"s)
              message = xpath(body, ~x"//Error//Description//text()"s)
              {:error, %{code: code, message: message}}
          end

        {:error, error} ->
          {:error, %{code: 1, message: "The USPS API is down.", extra: error}}
      end
    end
  end

  def package_pickup_schedule(data) do
    package_pickup_schedule(
      data.first_name,
      data.last_name,
      data.firm_name,
      data.suite_or_apt,
      data.address2,
      data.city,
      data.state,
      data.zip5,
      data.zip4,
      data.phone,
      data.extension,
      data.packages,
      data.estimated_weight,
      data.package_location,
      data.special_instructions,
      data.urbanization
    )
  end

  def package_pickup_schedule(
        first_name,
        last_name,
        firm_name,
        suite_or_apt,
        address2,
        city,
        state,
        zip5,
        zip4,
        phone,
        extension,
        packages \\ [],
        estimated_weight \\ 0,
        package_location \\ 0,
        special_instructions \\ 0,
        urbanization \\ nil
      ) do
    api = "CarrierPickupScheduleRequest"

    xml =
      build_package_pickup_schedule_request(
        first_name: first_name,
        last_name: last_name,
        firm_name: firm_name,
        suite_or_apt: suite_or_apt,
        address2: address2,
        city: city,
        state: state,
        zip5: zip5,
        zip4: zip4,
        phone: phone,
        extension: extension,
        packages: packages,
        estimated_weight: estimated_weight,
        package_location: package_location,
        special_instructions: special_instructions,
        urbanization: urbanization
      )

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      {:ok,
       xpath(
         body,
         ~x"//CarrierPickupScheduleResponse//Address"l,
         firm_name: ~x"./FirmName//text()"s,
         address1: ~x"./Address1//text()"s,
         address2: ~x"./Address2//text()"l,
         city: ~x"./City//text()"l,
         state: ~x"./State//text()"l,
         urbanization: ~x"./Urbanization//text()"l,
         zip5: ~x"./Zip5//text()"l,
         zip4: ~x"./Zip4//text()"l
       )}
    end
  end

  def hold_for_pickup(data) do
    hold_for_pickup(data.origin_zip, data.destination_zip, data.mail_class)
  end

  def hold_for_pickup(origin_zip, destination_zip, mail_class) do
    api = "HFPFacilityInfo"

    xml =
      build_hold_for_pickup_request(
        origin_zip: origin_zip,
        destination_zip: destination_zip,
        mail_class: mail_class
      )

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      {:ok,
       xpath(
         body,
         ~x"//HFPFacilityInfoResponse"l,
         pickup_city: ~x"./PickupCity//text()"s,
         pickup_state: ~x"./PickupState//text()"l,
         pickup_zip: ~x"./PickupZIP//text()"l,
         pickup_zip_4: ~x"./PickupZIP4//text()"l,
         service: ~x"./Service//text()"l
       )}
    end
  end

  def carrier_pickup_availability(data) do
    carrier_pickup_availability(
      data.firm_name,
      data.suite_or_apt,
      data.address2,
      data.city,
      data.state,
      data.zip5,
      data.zip4,
      data.urbanization
    )
  end

  def carrier_pickup_availability(
        firm_name,
        suite_or_apt,
        address2,
        city,
        state,
        zip5,
        zip4,
        urbanization \\ nil
      ) do
    api = "CarrierPickupAvailability"

    xml =
      build_carrier_pickup_availability_request(
        firm_name: firm_name,
        suite_or_apt: suite_or_apt,
        address2: address2,
        city: city,
        state: state,
        urbanization: urbanization,
        zip5: zip5,
        zip4: zip4
      )

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      {:ok,
       xpath(
         body,
         ~x"//CarrierPickupAvailabilityResponse//Address"l,
         firm_name: ~x"./FirmName//text()"s,
         address1: ~x"./Address1//text()"s,
         address2: ~x"./Address2//text()"l,
         city: ~x"./City//text()"l,
         state: ~x"./State//text()"l,
         urbanization: ~x"./Urbanization//text()"l,
         zip5: ~x"./Zip5//text()"l,
         zip4: ~x"./Zip4//text()"l
       )}
    end
  end

  def priority_mail_service_standards(data) do
    priority_mail_service_standards(data.origin_zip, data.destination_zip, data.mail_class)
  end

  def priority_mail_service_standards(origin_zip, destination_zip, mail_class) do
    api = "PriorityMail"

    xml =
      build_priority_mail_service_standards_request(
        origin_zip: origin_zip,
        destination_zip: destination_zip,
        mail_class: mail_class
      )

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      {:ok,
       xpath(
         body,
         ~x"//PriorityMailResponse"l,
         origin_zip: ~x"./OriginZip//text()"l,
         destination_zip: ~x"./DestinationZip//text()"l,
         days: ~x"./Days//text()"l,
         effective_acceptance_date: ~x"./EffectiveAcceptanceDate//text()"l,
         scheduled_delivery_date: ~x"./ScheduledDeliveryDate//text()"l
       )}
    end
  end

  def package_service_standardb(data) do
    package_service_standardb(data.origin_zip, data.destination_zip, data.type, data.mail_class)
  end

  def package_service_standardb(origin_zip, destination_zip, type, mail_class) do
    api = "StandardB"

    xml =
      build_package_service_standardb_request(
        origin_zip: origin_zip,
        destination_zip: destination_zip,
        type: type,
        mail_class: mail_class
      )

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      {:ok,
       xpath(
         body,
         ~x"//StandardBResponse"l,
         origin_zip: ~x"./OriginZip//text()"s,
         destination_zip: ~x"./DestinationZip//text()"l,
         days: ~x"./Days//text()"l,
         effective_acceptance_date: ~x"./EffectiveAcceptanceDate//text()"l,
         scheduled_delivery_date: ~x"./ScheduledDeliveryDate//text()"l
       )}
    end
  end

  def first_class_service_standards(data) do
    first_class_service_standards(
      data.origin_zip,
      data.destination_zip,
      data.type,
      data.mail_class
    )
  end

  def first_class_service_standards(origin_zip, destination_zip, type, mail_class) do
    api = "FirstClassMail"

    xml =
      build_first_class_service_standards_request(
        origin_zip: origin_zip,
        destination_zip: destination_zip,
        type: type,
        mail_class: mail_class
      )

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      {:ok,
       xpath(
         body,
         ~x"//PriorityMailResponse"l,
         origin_zip: ~x"./OriginZip//text()"s,
         destination_zip: ~x"./DestinationZip//text()"l,
         mail_class: ~x"./MailClass//text()"l
       )}
    end
  end

  def express_mail_commitments(data) do
    express_mail_commitments(
      data.origin_zip,
      data.destination_zip,
      data.date,
      data.drop_off_time,
      data.return_dates,
      data.pm_guarantee
    )
  end

  def express_mail_commitments(
        origin_zip,
        destination_zip,
        date,
        drop_off_time,
        return_dates \\ "true",
        pm_guarantee \\ "N"
      ) do
    api = "ExpressMailCommitment"

    xml =
      build_express_mail_commitments_request(
        origin_zip: origin_zip,
        destination_zip: destination_zip,
        date: date,
        drop_off_time: drop_off_time,
        return_dates: return_dates,
        pm_guarantee: pm_guarantee
      )

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      {:ok,
       xpath(
         body,
         ~x"//ExpressMailCommitmentResponse"l,
         message: ~x"./message//text()"s
       )}
    end
  end

  def fetch_rates(shipment) do
    rates =
      UspsEx.Service.services(shipment)
      |> Enum.map(fn x -> x.id end)
      |> Enum.map(fn x ->
        fetch_rate(shipment, x)
      end)

    {:ok, rates}
  end

  def machineable?(_, _, _) do
    "FALSE"
  end

  def machineable?(parcel, "Rectangular", true) do
    reply = parcel.length < 27 && parcel.height < 17 && parcel.height < 17 && parcel.weight < 28

    if reply == true do
      "TRUE"
    else
      "FALSE"
    end
  end

  def machineable?(parcel, "Nonrectangular", true) do
    reply = parcel.length < 27 && parcel.height < 17 && parcel.height < 17 && parcel.weight < 28

    if reply == true do
      "TRUE"
    else
      "FALSE"
    end
  end

  def machineable?(parcel, "Variable", true) do
    reply = parcel.length < 27 && parcel.height < 17 && parcel.height < 17 && parcel.weight < 28

    if reply == true do
      "TRUE"
    else
      "FALSE"
    end
  end

  def fetch_rate(shipment, service) do
    service =
      case service do
        %Service{} = service -> service
        s when is_atom(s) -> Service.get(s)
      end

    api =
      if international?(shipment) do
        "IntlRateV2"
      else
        "RateV4"
      end

    xml = build_rate_request(shipment: shipment, service: service)

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      spec =
        extra_services_spec(shipment) ++
          if international?(shipment) do
            [
              name: ~x"./SvcDescription//text()"s,
              service: ~x"./SvcDescription//text()"s,
              rate: ~x"./Postage//text()"f
            ]
          else
            [
              name: ~x"./MailService//text()"s,
              service: ~x"./MailService//text()"s,
              rate: ~x"./Rate//text()"s
            ]
          end

      rates =
        if international?(shipment) do
          xpath(
            body,
            ~x"//IntlRateV2Response//Package//Service"l,
            spec
          )
        else
          xpath(
            body,
            ~x"//RateV4Response//Package//Postage"l,
            spec
          )
        end
        |> add_line_items(shipment, service)
        |> Enum.map(fn response ->
          total = response.line_items |> Enum.map(& &1.price) |> Enum.sum()

          %{
            name: strip_html(response.name),
            service: description_to_service(response.service),
            rate: total,
            line_items: response.line_items
          }
        end)
        |> Enum.map(fn %{name: description, service: service} = response ->
          service = %{service | description: description}

          rate = %UspsEx.Rate{
            service: service,
            price: response.rate,
            line_items: response.line_items
          }

          {:ok, rate}
        end)

      rates =
        if international?(shipment) do
          rates
          |> Enum.sort(fn {:ok, rate1}, {:ok, rate2} ->
            service = String.downcase(service.description)

            d1 = String.jaro_distance(String.downcase(rate1.service.description), service)
            d2 = String.jaro_distance(String.downcase(rate2.service.description), service)

            d1 > d2
          end)
        else
          rates
        end

      case rates do
        [] -> {:error, "Rate unavailable for service."}
        [rate] -> rate
        list when is_list(list) -> hd(list)
      end
    end
  end

  def zipcode(address) do
    api = "ZipCodeLookup"
    xml = build_zipcode_request(address: address)

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      {:ok,
       xpath(
         body,
         ~x"//ZipCodeLookupResponse//Address"l,
         firm_name: ~x"./FirmName//text()"s,
         address1: ~x"./Address1//text()"s,
         address2: ~x"./Address2//text()"l,
         city: ~x"./City//text()"l,
         state: ~x"./State//text()"l,
         urbanization: ~x"./Urbanization//text()"l,
         zip5: ~x"./Zip5//text()"l,
         zip4: ~x"./Zip4//text()"l
       )}
    end
  end

  def fetch_city_state_by_zipcode(zipcode) do
    api = "CityStateLookup"
    xml = build_city_state_by_zipcode_request(zipcode: zipcode)

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}, %{
                    "Content-Type" => "application/xml"
                  }) do
      {:ok,
       xpath(
         body,
         ~x"//CityStateLookupRequest//ZipCode"l,
         zip: ~x"./Zip5//text()"s,
         city: ~x"./City//text()"l,
         state: ~x"./State//text()"l
       )}
    end
  end

  defp description_to_service(description) do
    cond do
      description =~ ~r/priority mail express/i ->
        :usps_priority_express

      description =~ ~r/priority/i ->
        :usps_priority

      description =~ ~r/first[-\s]*class/i ->
        :usps_first_class

      description =~ ~r/retail ground/i ->
        :usps_retail_ground

      description =~ ~r/media mail/i ->
        :usps_media

      description =~ ~r/library mail/i ->
        :usps_library

      description =~ ~r/gxg/i ->
        :usps_gxg

      true ->
        :usps_retail_ground
    end
    |> UspsEx.Service.get()
  end

  def international_mail_type(%Parcel{container: nil}), do: "PACKAGE"

  def international_mail_type(%Parcel{container: container}) do
    container = "#{container}"

    cond do
      container =~ ~r/envelope/i -> "ENVELOPE"
      container =~ ~r/flat[-\s]*rate/i -> "FLATRATE"
      container =~ ~r/rectangular|variable/i -> "PACKAGE"
      true -> "ALL"
    end
  end

  def validate_address(address) do
    api = "Verify"
    xml = build_validate_address_request(address: address)

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: xml}) do
      candidates =
        body
        |> xpath(
          ~x"//AddressValidateResponse//Address"l,
          address: ~x"./Address2//text()"s,
          address_line_2: ~x"./Address1//text()"s,
          city: ~x"./City//text()"s,
          state: ~x"./State//text()"s,
          postal_code: ~x"./Zip5//text()"s
        )
        |> Enum.map(fn candidate ->
          candidate
          |> Map.merge(Map.take(address, ~w(first_name last_name name company_name phone)a))
          |> UspsEx.Address.new!()
        end)

      {:ok, candidates}
    end
  end

  def create_transaction(shipment, service) when is_atom(service) do
    create_transaction(shipment, Service.get(service))
  end

  def create_transaction(shipment, service) do
    api =
      cond do
        not international?(shipment) ->
          "eVS"

        service.id == :usps_priority_express ->
          "eVSExpressMailIntl"

        service.id == :usps_priority ->
          "eVSPriorityMailIntl"

        service.id == :usps_first_class ->
          "eVSFirstClassMailIntl"

        true -> raise Error, message: "Only the Priority and Priority Express services are supported for
          international shipments at the moment. (Received :#{service.id}.)"

      end

    request = build_label_request(shipment: shipment, service: service, api: api)

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: request}) do
      spec =
        if international?(shipment) do
          [insurance_fee: ~x"//InsuranceFee//text()"s]
        else
          extra_services_spec(shipment, "Extra")
        end ++
          [
            rate: ~x"//Postage//text()"s,
            tracking_number: ~x"//BarcodeNumber//text()"s,
            image: ~x"//LabelImage//text()"s
          ]

      response = xpath(body, ~x"//#{api}Response", spec) |> add_line_items(shipment, service)

      line_items = response.line_items
      price = line_items |> Enum.map(& &1.price) |> Enum.sum()

      rate = %Rate{service: service, price: price, line_items: line_items}
      image = String.replace(response.image, "\n", "")
      label = %Label{tracking_number: response.tracking_number, format: :pdf, image: image}

      transaction = Transaction.new(shipment, rate, label)

      {:ok, transaction}
    end
  end

  def cancel_transaction(transaction) do
    cancel_transaction(transaction.shipment, transaction.label.tracking_number)
  end

  def cancel_transaction(shipment, tracking_number) do
    root =
      if international?(shipment) do
        "eVSI"
      else
        "eVS"
      end

    api = root <> "Cancel"

    request = build_cancel_request(root: root, tracking_number: tracking_number)

    with_response Client.post("ShippingAPI.dll", %{API: api, XML: request}) do
      data =
        xpath(
          body,
          ~x"//#{root}CancelResponse",
          status: ~x"//Status//text()"s,
          reason: ~x"//Reason//text()"s
        )

      status =
        if data.status =~ ~r/not cancel/i do
          :error
        else
          :ok
        end

      {status, data.reason}
    end
  end

  defp extra_services_spec(shipment, prefix \\ nil) do
    prefix =
      case prefix do
        nil ->
          if international?(shipment), do: "Extra", else: "Special"

        prefix ->
          prefix
      end

    [
      extra_services: [
        ~x"//#{prefix}Services//#{prefix}Service"l,
        id: ~x"./ServiceID//text()"s,
        name: ~x"./ServiceName//text()"s,
        available: ~x"./Available//text()"s |> transform_by(&String.downcase/1),
        price: ~x"./Price//text()"s
      ]
    ]
  end

  defp add_line_items(rates, shipment, service) when is_list(rates) do
    Enum.map(rates, fn rate -> add_line_items(rate, shipment, service) end)
  end

  defp add_line_items(rate, shipment, service) do
    postage_line_item = %{name: "Postage", price: rate.rate}

    insurance_line_item =
      Enum.map(shipment.parcels, fn parcel ->
        cond do
          is_nil(parcel.insurance) ->
            nil

          not is_nil(rate[:insurance_fee]) ->
            %{name: "Insurance", price: rate.insurance_fee}

          true ->
            insurance_code = Integer.to_string(insurance_code(shipment, service))

            rate.extra_services
            |> Enum.find(fn
              %{available: available, id: ^insurance_code} when available != "false" -> true
              _ -> false
            end)
            |> case do
              %{price: price} ->
                %{name: "Insurance", price: price}

              _ ->
                nil
            end
        end
      end)

    line_items =
      ([postage_line_item] ++ insurance_line_item)
      |> Enum.reject(&is_nil/1)
      |> Enum.map(fn %{price: price} = line_item ->
        %{line_item | price: price_to_cents(price)}
      end)

    Map.put(rate, :line_items, line_items)
  end

  def insurance_code(shipment, service),
    do: insurance_code(international?(shipment), service)

  def insurance_code(_, data), do: Insurance.code(data)

  def track_parcels(tracking_number) when is_binary(tracking_number) do
    track_parcels([tracking_number])
  end

  def track_parcels(tracking_numbers) when is_list(tracking_numbers) do
    request = build_track_request(tracking_numbers: tracking_numbers)

    with_response Client.post("ShippingAPI.dll", %{API: "TrackV2", XML: request}) do
      {:ok,
       xpath(
         body,
         ~x"//TrackResponse//TrackInfo"l,
         summary: ~x"./TrackSummary//text()"s,
         details: ~x"./TrackDetail//text()"l
       )}
    end
  end

  def module_id() do
    :usps
  end

  def config() do
    with un when is_binary(un) <-
           Application.get_env(:usps_ex, :username, {:error, :not_found, :username}),
         pw when is_binary(pw) <-
           Application.get_env(:usps_ex, :password, {:error, :not_found, :password}) do
      %{
        username: un,
        password: pw
      }
    else
      {:error, :not_found, token} ->
        raise InvalidConfigError, message: "USPS config key missing: #{token}"

      {:error, :not_found} ->
        raise InvalidConfigError, message: "USPS config is either invalid or not found."
    end
  end

  defdelegate env(), to: Config

  @version Mix.Project.config()[:version]
  def version, do: @version
end
