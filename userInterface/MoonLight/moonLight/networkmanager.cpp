#include "networkmanager.h"
#include <iostream>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<errno.h>

NetworkManager::NetworkManager() {
    int connfd = 0;
    int clen = 0;
    struct sockaddr_in client;

    client.sin_family = AF_INET;
    client.sin_port = htons(PORT);
    client.sin_addr.s_addr = inet_addr(IPADDRESS);
    connfd = socket(AF_INET, SOCK_STREAM, 0);
    // if(connfd<0)
    // {
    //     perror("socket");
    //     return;
    // }
    // if(connect(connfd, (struct sockaddr*)&client, sizeof(client))<0)
    // {
    //     perror("connect");
    //     return;
    // }
    handle_connection(connfd);
}


void NetworkManager::handle_connection(int sockfd)
{
    char sendline[MAXLINE], recvline[MAXLINE];
    int maxfdp, stdineof;
    struct pollfd pfds[2];
    int n;
    pfds[0].fd = sockfd;
    pfds[0].events = POLLIN;
    pfds[1].fd = STDIN_FILENO;
    pfds[1].events = POLLIN;
    while(1)
    {
        poll(pfds, 2, -1);
        if(pfds[0].revents & POLLIN)
        {
            n = read(sockfd, recvline, MAXLINE);
            if(n == 0)
            {
                std::cout << stderr << "client: server is closed." << std::endl;
                close(sockfd);
            }
            write(STDOUT_FILENO, recvline, n);
        }
        if(pfds[1].revents & POLLIN)
        {
            n = read(STDIN_FILENO, sendline, MAXLINE);
            if(n == 0)
            {
                shutdown(sockfd, SHUT_WR);
                continue;
            }
            write(sockfd, sendline, n);
        }
    }
}
