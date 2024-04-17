defmodule PhxTemplateWeb.DashboardLive do
  use PhxTemplateWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
      <div class="py-10">
    <header>
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <h1 class="text-3xl font-bold leading-tight tracking-tight text-gray-900">Dashboard</h1>
      </div>
    </header>
    <main>
      <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
        <!-- Your content -->
      </div>
    </main>
  </div>
    """
  end

  @impl Phoenix.LiveView
  def mount( params,  session,  socket) do

    {:ok, socket}
  end
end
