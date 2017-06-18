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

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:write, {table, data}}, _from, store) do
    Map.put_new(store, table, data)
    {:reply, "Write to #{to_string(table)}", store}
  end
end
