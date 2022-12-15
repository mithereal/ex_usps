defmodule UspsExTest do
  use ExUnit.Case
  doctest UspsEx

  test "Track a Shipment" do
    {status, data} = reply = UspsEx.track_parcels("9400109105114514324644")
    assert status == :ok
  end
end
