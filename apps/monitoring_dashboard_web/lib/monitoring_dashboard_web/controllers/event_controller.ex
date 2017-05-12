defmodule MonitoringDashboard.Web.EventController do
  use MonitoringDashboard.Web, :controller

  def index(conn, _params) do
    conn = conn
    |> put_resp_content_type("text/event-stream")
    |> send_chunked(200)
    {:ok, conn} = send_message(conn, "hi")
    conn
  end

  defp send_message(conn, message) do
    chunk(conn, "event: \"message\"\n\ndata: {\"message\": \"#{message}\"}\n\n")
  end
end
