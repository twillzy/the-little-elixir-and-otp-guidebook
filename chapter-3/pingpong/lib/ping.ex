defmodule PingPong.Ping do
  def loop do
    receive do
      {:ping, sender_pid} ->
        IO.puts("Ping")
        :timer.sleep(500)
        send(sender_pid, {:pong, self()})
      _ ->
        IO.puts("Can't ping dis")
    end
    loop()
  end
end
