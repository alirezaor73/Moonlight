#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QObject>
#include <QTcpSocket>
#define IPADDRESS "127.0.0.1"
#define PORT 6666
#define MAXLINE 1024
#define max(a, b) (a>b)?a:b

class NetworkManager : public QObject
{
    Q_OBJECT
public:
    NetworkManager();
    void connectTcp();
    void sendTcpData(QByteArray data);
private slots:
    void readTcpData();

private:
    QTcpSocket *_pSocket;
};

#endif // NETWORKMANAGER_H
