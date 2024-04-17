import emailjs from "@emailjs/browser";

export function send_email_confirmation(email, url, message) {
  console.log("sending email...");

  emailjs.send(
    "insert your service id here",
    "insert your template id here",
    {
      url: url,
      email: email,
      message: message,
    },
    {
      publicKey: "insert your public key here",
    }
  );
}
