
defmodule Ehrenbot do
  import Thread
  import Comment
  require HttpUtil
  require Constants

  #TODO: boilerplate here
  process_threads = fn body ->
    #Bangs are side effect functions. TODO: consider to replace to not-sideeffect and handle with applicatives.
    res = Poison.decode!(body,as: %{"response" => [%Thread{}]})
    Map.fetch!(res, "response")
  end
  process_messages = fn body ->
    res =  Poison.decode!(body, as: %{"response" => [%Comment{}]})
    Map.fetch!(res, "response")
  end

  IO.puts "starting!!!!!!!!!!!!!!!!!!!!"
  HTTPoison.start
  threads = HttpUtil.http_get_req_processing(Constants.url_list_threads, process_threads)
  newest_thread = List.first(threads)
  posts = Enum.flat_map(threads, fn(thread) ->
    HttpUtil.http_get_req_processing(Constants.url_list_posts(thread.id), process_messages)
   end)
  posts = Enum.sort_by(posts, fn(post) -> post.likes end, &((&1) > (&2)))
  posts = Enum.slice(posts, 1..5)
  IO.inspect posts
end
