require 'socket'

BUFER_SIZE = 1024

socket = UDPSocket.new
socket.bind('192.168.33.10', 4321)

loop do
    massage, sender = socket.recvfrom(BUFER_SIZE)

    port = sender[1]
    host = sender[2]

    socket.send(massage.upcase, 0, host, port)
end