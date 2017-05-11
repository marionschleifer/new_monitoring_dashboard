defmodule MonitoringDashboard.Web.PageController do
  use MonitoringDashboard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
