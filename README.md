# Phoenix Nav Mailer Template

## Initial Setup

- Create an account at ['EmailJS'](https://www.emailjs.com/)
- Create a template with To Email as {{ email }}
- Inside the content, set as Hello, {{ message }} \n {{ url }}
- Customize the other fields to your needs
- Copy your service_id, template_id and publicKey
- Paste them in /assets/js/mailer.js

## Done!

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
