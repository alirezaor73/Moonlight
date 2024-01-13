#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include<sys/types.h>
#include<sys/socket.h>
#include<unistd.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<sys/wait.h>
#include<strings.h>
#include<poll.h>
#define IPADDRESS "127.0.0.1"
#define PORT 6666
#define MAXLINE 1024
#define LISTENQ 5
#define OPEN_MAX 1000
#define INFTIM -1

class NetworkManager
{
public:
    NetworkManager();

private:
    int bind_and_listen();
    void do_poll(int listenfd);


private:

};

#endif // NETWORKMANAGER_H
