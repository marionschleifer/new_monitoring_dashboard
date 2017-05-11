defmodule MonitoringDashboard.Web.Router do
  use MonitoringDashboard.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MonitoringDashboard.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/dashboards/basic", DashboardController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", MonitoringDashboard.Web do
  #   pipe_through :api
  # end
end
