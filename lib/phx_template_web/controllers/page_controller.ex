defmodule PhxTemplateWeb.PageController do
  use PhxTemplateWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    if conn.assigns[:current_user] do
      conn
      |> redirect(to: "/dashboard")
    else
      render(conn, :home, layout: false)
    end
  end
end
