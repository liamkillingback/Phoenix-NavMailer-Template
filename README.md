# Phoenix Nav Mailer Template

![Alt text](https://i.imgur.com/PGZEyUw.png)

This template includes a fully responsive navbar set up with tab highlighting, once logged in. Additionally has a fully set up free emailing service, just need to create your free account and set up an email template for your use case.

- **Not logged in = "/" and no navbar**
- **Logged in = "/dashboard" and has Navbar**

See page_controller.ex for that info.

## Initial Setup

- Create an account at [EmailJS](https://www.emailjs.com/)
- Add an email service & Copy Service ID
- Create a template with To Email as {{ email }}
- Inside the content, set as Hello, {{ message }} \n {{ url }}
- Customize the other fields to your needs
- Copy your template_id under Email Templates -> Settings
- Copy your publicKey from Account tab
- Paste them in /assets/js/mailer.js
- Spin up a database for the auth system

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
