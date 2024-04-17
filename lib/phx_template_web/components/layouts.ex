defmodule PhxTemplateWeb.Layouts do
  use PhxTemplateWeb, :html

  embed_templates "layouts/*"

  attr :content, :string
  attr :title, :string
  attr :current_user, :any
  attr :isOpen, :boolean, default: false
  attr :active_tab, :atom
  def side_bar(assigns) do
    ~H"""
      <div>
        <!-- Off-canvas menu for mobile, show/hide based on off-canvas menu state. -->
        <div id="mobile-sidebar-container" class={"relative z-50 lg:hidden"} role="dialog" aria-modal="true">
          <!--
            Off-canvas menu backdrop, show/hide based on off-canvas menu state.

            Entering: "transition-opacity ease-linear duration-300"
              From: "opacity-0"
              To: "opacity-100"
            Leaving: "transition-opacity ease-linear duration-300"
              From: "opacity-100"
              To: "opacity-0"
          -->
          <div id="sidebar-container" phx-click={hide_mobile_sidebar()} class={"fixed hidden inset-0"}>

            <!--
              Off-canvas menu, show/hide based on off-canvas menu state.

              Entering: "transition ease-in-out duration-300 transform"
                From: "-translate-x-full"
                To: "translate-x-0"
              Leaving: "transition ease-in-out duration-300 transform"
                From: "translate-x-0"
                To: "-translate-x-full"
            -->
            <div id="mobile-sidebar" class="relative h-screen mr-16 flex w-full max-w-xs flex-1 -translate-x-full transition ease-in-out duration-300 transform">
              <!--
                Close button, show/hide based on off-canvas menu state.

                Entering: "ease-in-out duration-300"
                  From: "opacity-0"
                  To: "opacity-100"
                Leaving: "ease-in-out duration-300"
                  From: "opacity-100"
                  To: "opacity-0"
              -->
              <div class="absolute left-full top-0 flex w-16 justify-center pt-5">
                <button phx-click={hide_mobile_sidebar()} id="hide-mobile-sidebar"  type="button" class="-m-2.5 p-2.5 hidden">
                  <span class="sr-only">Close sidebar</span>
                  <svg class="h-6 w-6 text-washed-purple-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>

              <!-- Sidebar component, swap this element with another sidebar if you like -->
              <div  class={"flex grow pb-40 flex-col bg-brand/brand-dark px-6 pb-4 ring-1 ring-white/10"}>
                <div class="flex h-16 gap-5 shrink-0 items-center">
                  <img class="h-8 w-auto" src="/images/logo.svg" alt="Your Company">
                  <p class="text-white">Title</p>
                </div>


                  <ul role="list" class="flex flex-col flex-col gap-y-7">
                    <li>
                      <ul role="list" class="-mx-2 space-y-1">
                        <li>
                          <!-- Current: "bg-gray-800 text-white", Default: "text-gray-400 hover:text-white hover:bg-washed-purple-900 transition-all" -->
                          <.link patch={~p"/dashboard"} class={"#{if @active_tab == :dashboard, do: "bg-primary-purple-500 text-white"} text-gray-400 hover:text-white hover:bg-washed-purple-900 transition-all group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold"}>
                            <svg class="h-6 w-6 shrink-0" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
                            </svg>
                            Dashboard
                          </.link>
                        </li>
                        <%!-- more items --%>
                      </ul>
                    </li>

                    <li class="mt-auto">
                      <.link patch={~p"/users/settings"} class={"#{if @active_tab == :settings, do: "bg-primary-purple-500 text-white"} group -mx-2 flex gap-x-3 rounded-md p-2 text-sm font-semibold leading-6 text-gray-400 hover:bg-washed-purple-900 transition-all hover:text-white"}>
                        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z" />
                          <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                        Settings
                      </.link>
                    </li>
                    <li class="mt-auto">
                      <.link method="delete" href={"/users/log_out"} class={"group -mx-2 flex gap-x-3 rounded-md p-2 text-sm font-semibold leading-6 text-gray-400 hover:bg-washed-purple-900 transition-all hover:text-white"}>
                      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 9V5.25A2.25 2.25 0 0 1 10.5 3h6a2.25 2.25 0 0 1 2.25 2.25v13.5A2.25 2.25 0 0 1 16.5 21h-6a2.25 2.25 0 0 1-2.25-2.25V15m-3 0-3-3m0 0 3-3m-3 3H15" />
                      </svg>

                        Log out
                      </.link>
                    </li>
                  </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Static sidebar for desktop -->
        <div class="hidden lg:fixed lg:inset-y-0 lg:z-50 lg:flex lg:w-72 lg:flex-col">
          <!-- Sidebar component, swap this element with another sidebar if you like -->
          <div class="flex grow flex-col gap-y-5 overflow-y-auto bg-brand/brand-dark border-r border-washed-purple-900 px-6 pb-4">
            <div class="flex h-16 gap-5 shrink-0 items-center">
              <img class="h-8 w-auto" src="/images/logo.svg" alt="Your Company">
              <p class="text-white">Title</p>
            </div>
            <nav class="flex flex-1 flex-col">

              <ul role="list" class="flex flex-1 flex-col gap-y-7">
                <li>
                  <ul role="list" class="-mx-2 space-y-1">
                    <li>
                      <!-- Current: "bg-gray-800 text-white", Default: "text-gray-400 hover:text-white hover:bg-washed-purple-900 transition-all" -->
                      <.link patch={~p"/dashboard"} class={"#{if @active_tab == :dashboard, do: "bg-primary-purple-500 text-white"} text-gray-400 hover:text-white hover:bg-washed-purple-900 transition-all group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold"}>
                        <svg class="h-6 w-6 shrink-0" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
                        </svg>
                        Dashboard
                      </.link>
                    </li>
                    <%!-- more links --%>
                  </ul>
                </li>

                <li class="mt-auto">
                  <.link patch={~p"/users/settings"} class={"#{if @active_tab == :settings, do: "bg-primary-purple-500 text-white"} group -mx-2 flex gap-x-3 rounded-md p-2 text-sm font-semibold leading-6 text-gray-400 hover:bg-washed-purple-900 transition-all hover:text-white"}>
                  <svg class="h-6 w-6 shrink-0" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z" />
                      <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    Settings
                  </.link>
                </li>
                  <%= if @current_user do %>
                    <li class="mt-auto">
                      <.link method="delete" href={"/users/log_out"} class={"group -mx-2 flex gap-x-3 rounded-md p-2 text-sm font-semibold leading-6 text-gray-400 hover:bg-washed-purple-900 transition-all hover:text-white"}>
                      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 9V5.25A2.25 2.25 0 0 1 10.5 3h6a2.25 2.25 0 0 1 2.25 2.25v13.5A2.25 2.25 0 0 1 16.5 21h-6a2.25 2.25 0 0 1-2.25-2.25V15m-3 0-3-3m0 0 3-3m-3 3H15" />
                      </svg>

                        Log out
                      </.link>
                    </li>
                  <% else %>
                    <li class="mt-auto">
                      <.link href={"/users/log_in"} class={"group -mx-2 flex gap-x-3 rounded-md p-2 text-sm font-semibold leading-6 text-gray-400 hover:bg-washed-purple-900 transition-all hover:text-white"}>
                      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 9V5.25A2.25 2.25 0 0 1 10.5 3h6a2.25 2.25 0 0 1 2.25 2.25v13.5A2.25 2.25 0 0 1 16.5 21h-6a2.25 2.25 0 0 1-2.25-2.25V15m-3 0-3-3m0 0 3-3m-3 3H15" />
                      </svg>
                        Log In
                      </.link>
                    </li>
                  <% end %>
              </ul>
            </nav>
          </div>
        </div>

        <div class="lg:pl-72 z-40 ">
          <div class="sticky flex w-full bg-white justify-between top-0 z-40 flex h-16 shrink-0 items-center gap-x-4 text-washed-purple-200 px-4 shadow-sm sm:gap-x-6 sm:px-6 lg:px-8">
            <button phx-click={show_mobile_sidebar()}  type="button" class="-m-2.5 p-2.5 text-gray-700 lg:hidden">
              <span class="sr-only">Open sidebar</span>
              <svg class="h-6 w-6  text-washed-purple-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
              </svg>
            </button>

            <!-- Profile dropdown -->
            <div class="relative">
              <button type="button" class="-m-1.5 flex items-center p-1.5"  >
                <span class="flex items-center">
                <.link patch={~p"/users/settings"} >
                  <span class=" text-sm text-neutrals-9 font-semibold leading-6"><%= @current_user && @current_user.email %></span>

                </.link>

                </span>
              </button>
            </div>
          </div>

          <main class="pb-10">
            <div class="px-4 sm:px-6 lg:px-8">
              <%= @content %>
            </div>
          </main>
        </div>
      </div>


    """
  end


end
