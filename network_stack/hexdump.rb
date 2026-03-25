require 'hexdump'

BUFER_SIZE = 1024

loop do
    data = socket.recv(BUFER_SIZE)

    Hexdump.dump(data)
end