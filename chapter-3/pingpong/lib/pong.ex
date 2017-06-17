defmodule PingPong.Pong do
  def loop do
    receive do
      {:pong, sender_pid} ->
        IO.puts("Pong")
        :timer.sleep(500)
        send(sender_pid, {:ping, self()})
      _ ->
        IO.puts("Can't pong dis")
    end
    loop()
  end
end
