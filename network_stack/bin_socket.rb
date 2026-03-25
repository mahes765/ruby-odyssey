ETH_P_ALL = 0x0003

SOCKADDR_LL_SIZE = 0x0014

socaddr_ll = [Socket::AF_PACKET].pack('s')
socaddr_ll << [ETH_P_ALL].pack('s')
socaddr_ll << index
socaddr_ll << ("\x00" * (SOCADDR_LL_SIZE - socaddr_ll.length))

socket.bind(socaddr_ll)