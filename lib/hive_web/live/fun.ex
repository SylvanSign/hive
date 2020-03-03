defmodule HiveWeb.FunLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    x: <%= @x %>
    <button phx-click="+">+</button>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :x, 0)}
  end

  def handle_event("+", _value, socket) do
    {:noreply, assign(socket, :x, socket.assigns.x + 1)}
  end
end
