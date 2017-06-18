defmodule Cache do
  use GenServer

  @name CACHE

  ## Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: CACHE])
  end

  def write(table, data) do
    GenServer.call(@name, {:write, {table, data}})
  end

  def read(table) do
    GenServer.call(@name, {:read, table})
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:write, {table, data}}, _from, store) do
    store = Map.put_new(store, table, data)
    {:reply, "Write to #{to_string(table)}", store}
  end

  def handle_call({:read, table}, _from, store) do
    {:reply, Map.get(store, table), store}
  end
end
