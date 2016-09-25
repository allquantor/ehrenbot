defmodule HttpUtil do
  def http_get_req_processing(request_url, ok_callback_body) do
    case HTTPoison.get request_url do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        ok_callback_body.(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
