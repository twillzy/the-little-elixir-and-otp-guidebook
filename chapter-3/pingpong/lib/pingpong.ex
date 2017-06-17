defmodule PingPong do
  def start do
    ping_pid = spawn(PingPong.Ping, :loop, [])
    pong_pid = spawn(PingPong.Pong, :loop, [])
    send(ping_pid, {:ping, pong_pid})
  end
end
