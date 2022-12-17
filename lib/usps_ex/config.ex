defmodule UspsEx.Config do
  @moduledoc false

  alias UspsEx.Error

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
        raise Error, message: "USPS config key missing: #{token}"

      {:error, :not_found} ->
        raise Error, message: "USPS config is either invalid or not found."
    end
  end

  def currency_code() do
    case Application.get_env(:usps_ex, :currency, :usd) do
      code when code in [:usd, :can, :mxn] ->
        code |> Atom.to_string() |> String.upcase()

      _ ->
        raise Error, "UspsEx currency must be either :usd, :can, or :mxn"
    end
  end

  def env() do
    Application.get_env(:usps_ex, :env, :dev)
  end
end
