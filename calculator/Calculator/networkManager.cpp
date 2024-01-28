#include "networkManager.h"
#include <iostream>
#include <ostream>
#include <string.h>

NetworkManager::NetworkManager()
{
}

void NetworkManager::init()
{
    int serverSocket;
    struct sockaddr_in serverAddr;

    serverSocket = socket(AF_INET, SOCK_STREAM, 0);
    if(serverSocket < 0) {
        std::cerr << "Cannot open socket" << std::endl;
        return ;
    }

    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(PORT);
    serverAddr.sin_addr.s_addr = inet_addr(IPADDRESS);

    if(bind(serverSocket, (struct sockaddr*)&serverAddr, sizeof(serverAddr)) < 0) {
        std::cerr << "Cannot bind socket" << std::endl;
        close(serverSocket);
        return ;
    }

    if(listen(serverSocket, 10) < 0) {
        std::cerr << "Cannot listen on socket" << std::endl;
        close(serverSocket);
        return ;
    }

    std::cout << "Server is listening on " << IPADDRESS << ":" << PORT << std::endl;

    while(true) {
        struct sockaddr_in clientAddr;
        socklen_t clientAddrLen = sizeof(clientAddr);
        int clientSocket = accept(serverSocket, (struct sockaddr*)&clientAddr, &clientAddrLen);
        if(clientSocket < 0) {
            std::cerr << "Cannot accept client" << std::endl;
            continue;
        }

        while(true) {
            char buffer[1024];
            memset(buffer, 0, sizeof(buffer));
            ssize_t bytesRead = recv(clientSocket, buffer, 1024, 0);
            if(bytesRead <= 0) {
                std::cerr << "Error reading from client or client disconnected" << std::endl;
                break;
            } else {
                std::cout << "Received message from client: " << buffer << std::endl;
                send(clientSocket, buffer, bytesRead, 0);
            }
        }

        close(clientSocket);
    }

    close(serverSocket);
    return;

}

