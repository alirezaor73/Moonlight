#include "networkManager.h"
#include <iostream>
#include <ostream>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

NetworkManager::NetworkManager() {

}

void NetworkManager::init()
{
    int listenfd = bind_and_listen();
    if(listenfd<0)
    {
        return;
    }
    do_poll(listenfd);
    return;
}

int NetworkManager::bind_and_listen()
{
    int serverfd;
    struct sockaddr_in my_addr;
    unsigned int sin_size;
    if((serverfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
    {
        perror("socket");
        return -1;
    }
    std::cout << "socket ok" << std::endl;
    my_addr.sin_family = AF_INET;
    my_addr.sin_port = htons(PORT);
    my_addr.sin_addr.s_addr = INADDR_ANY;
    bzero(&(my_addr.sin_zero), 0);
    if(bind(serverfd, (struct sockaddr*)&my_addr, sizeof(struct sockaddr)) == -1)
    {
        perror("bind");
        return -2;
    }
    std::cout << "bind ok" << std::endl;
    if(listen(serverfd, LISTENQ) == -1)
    {
        perror("listen");
        return -3;
    }
    std::cout << "listen ok" << std::endl;
    return serverfd;
}

void NetworkManager::do_poll(int listenfd)
{
    int connfd, sockfd;
    struct sockaddr_in cliaddr;
    socklen_t cliaddrlen;
    struct pollfd clientfds[OPEN_MAX];
    int maxi;
    int i;
    int nready;
    clientfds[0].fd = listenfd;
    clientfds[0].events = POLLIN;
    for(i = 1; i<OPEN_MAX; i++)
        clientfds[i].fd = -1;
    maxi = 0;

    while(1)
    {
        nready = poll(clientfds, maxi+1, INFTIM);
        if(nready == -1)
        {
            perror("poll error:");
            exit(1);
        }
        if(clientfds[0].revents & POLLIN)
        {
            cliaddrlen = sizeof(cliaddr);
            if((connfd = accept(listenfd, (struct sockaddr*)&cliaddr, &cliaddrlen)) == -1)
            {
                if(errno == EINTR)
                    continue;
                else
                {
                    perror("accept error:");
                    exit(1);
                }
            }
            std::cout  << "accept a new client:" << inet_ntoa(cliaddr.sin_addr) << cliaddr.sin_port << std::endl;
            for(i = 1; i<OPEN_MAX; i++)
            {
                if(clientfds[i].fd<0)
                {
                    clientfds[i].fd = connfd;
                    break;
                }
            }
            if(i == OPEN_MAX)
            {
                std::cout  << "too many clients.\n" << std::endl;
                exit(1);
            }
            clientfds[i].events = POLLIN;
            maxi = (i>maxi?i:maxi);
            if(--nready<=0)
                continue;
        }

        char buf[MAXLINE];
        memset(buf, 0, MAXLINE);
        int readlen = 0;
        for(i = 1; i<maxi; i++)
        {
            if(clientfds[i].fd<0)
                continue;
            if(clientfds[i].revents & POLLIN)
            {
                readlen = read(clientfds[i].fd, buf, MAXLINE);
                if(readlen == 0)
                {
                    close(clientfds[i].fd);
                    clientfds[i].fd = -1;
                    continue;
                }
                std::cout << "msg is:";
                write(STDOUT_FILENO, buf, readlen);
                write(clientfds[i].fd, buf, readlen);
            }
        }
    }
}
