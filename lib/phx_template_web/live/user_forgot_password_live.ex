defmodule PhxTemplateWeb.UserForgotPasswordLive do
  use PhxTemplateWeb, :live_view

  alias PhxTemplate.Accounts

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm flex flex-col justify-center items-center h-screen">
      <.header class="text-center">
        Forgot your password?
        <:subtitle>We'll send a password reset link to your inbox</:subtitle>
      </.header>

      <.simple_form for={@form} id="reset_password_form" phx-submit="send_email">
        <.input field={@form[:email]} type="email" placeholder="Email" required />
        <:actions>
          <.button phx-disable-with="Sending..." class="w-full">
            Send password reset instructions
          </.button>
        </:actions>
      </.simple_form>
      <p class="text-center text-sm mt-4">
        <.link href={~p"/users/register"}>Register</.link>
        | <.link href={~p"/users/log_in"}>Log in</.link>
      </p>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: to_form(%{}, as: "user"))}
  end

  def handle_event("send_email", %{"user" => %{"email" => email}}, socket) do
    if user = Accounts.get_user_by_email(email) do
      {user_email, url} = Accounts.deliver_user_reset_password_instructions(
        user,
        &url(~p"/users/reset_password/#{&1}")
      )

      info =
        "If your email is in our system, you will receive instructions to reset your password shortly."
      message = "Please click the link below to reset your password."

        {:noreply,
        socket
        |> push_event("send_confirmation", %{email: user_email, url: url, message: message})
        |> put_flash(:info, info)
        # |> redirect(to: ~p"/")
        }
      else
        {:noreply, put_flash(socket, :error, "Email not found")}
      end
    end
end
