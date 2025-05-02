defmodule UspsEx.Legacy.Error do
  defexception [:message]

  def exception(message) do
    %__MODULE__{message: message}
  end
end
