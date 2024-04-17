defmodule PhxTemplateWeb.Navbar do
  import Phoenix.LiveView
  use Phoenix.Component

  alias PhxTemplate.Accounts

  def on_mount(:default, _params, session, socket) do
    {:cont,
    socket
    |> assign(:isOpen, false)
    |> attach_hook(:active_tab, :handle_params, &handle_active_tab_params/3)
    |> attach_hook(:toggle_sidebar, :handle_event, &handle_toggle_sidebar/3)}
  end

  defp handle_active_tab_params(params, _url, socket) do
    active_tab =
      case {socket.view, socket.assigns.live_action} do
        {PhxTemplateWeb.UserSettingsLive, _} -> :settings
        {PhxTemplateWeb.DashboardLive, _} -> :dashboard
        {_, _} -> :dashboard
      end
    {:cont, assign(socket, active_tab: active_tab)}

  end

  defp handle_toggle_sidebar(_event, _params, socket) do
    {:cont,
    socket
    |> assign(:isOpen, !socket.assigns.isOpen)
    }
  end

end
