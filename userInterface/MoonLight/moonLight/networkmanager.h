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
#include <QObject>
#define IPADDRESS "127.0.0.1"
#define PORT 6666
#define MAXLINE 1024
#define max(a, b) (a>b)?a:b

class NetworkManager : public QObject
{
    Q_OBJECT
public:
    NetworkManager();
    static void handle_connection(int sockfd);
};

#endif // NETWORKMANAGER_H
