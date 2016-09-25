defmodule Thread do
  @derive [Poison.Encoder]
  defstruct [:id, :clean_title]
end

defmodule Comment do
  @derive [Poison.Encoder]
  defstruct [:raw_message, :likes, :id]
end
