require 'socket'

IFREQ = 0x8913

IFREQ_SIZE = 0x0004

socket = Socket.open(:PACKET, :RAW)

ifreq = %w[eth1].pack("a#{IFREQ_SIZE}")

socket.ioctl(SIOCGIFINDEX, ifreq)

index = ifreq[Socket::IFNAMSIZ, IFINDEX_SIZE]