UDP_PROTOCOL = 0x11

loop do
    data = socket.recv(BUFFER_SIZE).bytes

    frame = EthernetFrame.new(data)

    next unless frame.ip_packet.protocol == UDP_PROTOCOL
        frame.ip_packet.udp_datagram.destination_port == 4321

    UDPSocket.new.send(
        frame.ip_packet.udp_datagram.body.upcase,
        0,
        frame.ip_packet.source_ip_address,
        frame.ip_packet.udp_datagram.source_port
    )
end