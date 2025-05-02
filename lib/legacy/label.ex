defmodule UspsEx.Legacy.Label do
  @fields ~w(image_parameters from_name from_firm from_address1 from_address2 from_city from_state from_zip from_phone pozip_code allow_non_cleansed_origin_addr to_name to_firm to_address1 to_address2 to_city to_state to_zip5 to_zip4 to_phone pobox to_contact_preference to_contact_email allow_non_cleansed_dest_addr weight_in_ounces service_type container width length height machinable processing_category price_options insured_amount address_service_requested express_mail_options ship_date customer_ref_no customer_ref_no2 extra_services hold_for_pickup open_distribute permit_number permit_zipcode permit_holder_name vendor_code vendor_product_version_number sender_name sender_email recipient_name recipient_name_email image_type hold_for_manifest nine_digit_routing_zip ship_info carrier_release return_commitments print_customer_ref_no print_customer_ref_no_2 action_code opt_out_of_spe sortation_level content)a

  defstruct @fields

  defmodule ExpressMailOptions do
    defstruct [
      :delivery_option,
      :waiver_of_signature
    ]
  end

  defmodule ExtraServices do
    defstruct [
      :extra_service
    ]
  end

  defmodule Content do
    defstruct [
      :content_type,
      :content_description
    ]
  end
end
