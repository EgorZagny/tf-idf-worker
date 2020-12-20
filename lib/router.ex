defmodule TfIdfWorker.Router do
    use Plug.Router
  
    plug :match
    plug :dispatch
    plug Plug.Parsers, parsers: [:urlencoded]
  
    post "/tf" do
        {:ok, data, _conn} = read_body(conn)
        data = Poison.decode!(data)
        result = "#{TfIdfWorker.tf(data["word"], data["text"])}"
        :timer.sleep(5_000)
        send_resp(conn, 200, result)
    end

    post "/isInText" do
        {:ok, data, _conn} = read_body(conn)
        data = Poison.decode!(data)
        result = "#{TfIdfWorker.isInText(data["word"], data["text"])}"
        :timer.sleep(5_000)
        send_resp(conn, 200, result)
    end

    match _ do
        send_resp(conn, 404, "Requested page not found!")
    end
  end