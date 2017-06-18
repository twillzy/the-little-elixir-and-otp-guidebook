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

  def delete(table) do
    GenServer.call(@name, {:delete, table})
  end

  def clear do
    GenServer.cast(@name, :clear)
  end

  def exist?(table) do
    GenServer.call(@name, {:exist, table})
  end

  ## Server API
  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:write, {table, data}}, _from, store) do
    store = Map.put_new(store, table, data)
    {:reply, store, store}
  end

  def handle_call({:read, table}, _from, store) do
    {:reply, Map.get(store, table), store}
  end

  def handle_call({:delete, table}, _from, store) do
    store = Map.update(store, table, [], &(&1 = []))
    {:reply, store, store}
  end

  def handle_call({:exist, table}, _from, store) do
    exist = Map.has_key?(store, table)
    {:reply, exist, store}
  end

  def handle_cast(:clear, _store) do
    {:noreply, %{}}
  end
end
