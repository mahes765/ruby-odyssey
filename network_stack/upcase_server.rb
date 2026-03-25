require 'socket'

BUFER_SIZE = 1024

socket = UDPSocket.new
socket.bind('192.168.33.10', 4321)

loop do
    massage, sender = socket.recvfrom(BUFER_SIZE)

    port = sender[1]
    host = sender[2]
    receiver = sender[3]

    socket.send(massage.upcase, 0, host, port)
end

socket.open(:INET, :DGRAM)

socket.open(:INET, :RAW, Socket::IPPROTO_UDP)

socket.open(:PACKET, :RAW)

request = {name : 'eth1', index: nil}
socket.ioctl(SIOCGIFINDEX, request)
request[:index] # => 0x3
request[:name] # => 'eth1'
request[:reserved] # => 0x00000000

