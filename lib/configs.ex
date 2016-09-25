defmodule Constants do
    @disqus_api  "https://disqus.com/api/3.0/"
    def disqus_api, do: @disqus_api
    @forums  "forums/"
    def forums, do: @forums
    @threads  "threads/"
    def threads, do: @threads
    @list_threads  "listThreads.json?forum=raupdatede"
    def list_threads, do: @list_threads
    @list_posts  "listPosts.json?forum=raupdatede"
    def list_posts, do: @list_posts
    @api_key "&api_key=E8Uh5l5fHZ6gD8U3KycjAIAk46f68Zw7C6eW8WSjZvCLXebZ7p0r1yrYDrLilk2F"
    def api_key, do: @api_key
    @url_list_threads (@disqus_api <> @forums  <> @list_threads <> @api_key)
    def url_list_threads, do: @url_list_threads

    def url_list_posts (thread_id) do
      (@disqus_api <> @threads <> @list_posts <> "&thread=" <>
      thread_id <> @api_key)
    end
end
