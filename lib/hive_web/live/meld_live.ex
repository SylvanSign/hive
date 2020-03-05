defmodule HiveWeb.MeldLive do
  use Phoenix.LiveView

  def render(assigns) do
    import Phoenix.HTML.Form

    ~L"""
    <h1>Name: <%= @name %></h1>
    <%= f = form_for :form, "", phx_submit: "submit" %>
      <%= label f, :thought %>
      <%= text_input f, :thought, placeholder: "type your thought here...", autofocus: true, disabled: @disabled %>
    </form>
    <h1><%= @thought %></h1>
    """
  end

  def mount(_params, session, socket) do
    name = Map.get(session, "name", "anonymous")

    socket =
      socket
      |> assign(:name, name)
      |> assign(:thought, "")
      |> assign(disabled: false)

    {:ok, socket}
  end

  def handle_event("submit", %{"form" => %{"thought" => thought}}, socket) do
    socket =
      socket
      |> put_flash(:info, "thought uploaded")

    # |> assign(disabled: true)

    {:noreply, assign(socket, :thought, thought)}
  end

  def handle_event("yo", _value, socket) do
    {:noreply, Phoenix.LiveView.put_flash(socket, :info, "yo")}
  end
end
