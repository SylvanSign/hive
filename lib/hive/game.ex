defmodule Hive.Game do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def start_link([]) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, %Hive.State{}}
  end

  def state(pid \\ __MODULE__) do
    GenServer.call(pid, :state)
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end
end
