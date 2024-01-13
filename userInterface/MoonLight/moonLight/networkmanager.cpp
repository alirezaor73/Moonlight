#include "networkmanager.h"
#include "QTimer"

NetworkManager::NetworkManager() {

}

void NetworkManager::connectTcp()
{
    ; // <-- fill with data

    _pSocket = new QTcpSocket( this ); // <-- needs to be a member variable: QTcpSocket * _pSocket;
    connect( _pSocket, &QTcpSocket::readyRead ,this , &NetworkManager::readTcpData);

    _pSocket->connectToHost("127.0.0.1", 6666);
    if( _pSocket->waitForConnected() ) {
        qDebug() << "client connected";
    }

    QTimer *timerUpdateAssign = new QTimer();
    QObject::connect(timerUpdateAssign, &QTimer::timeout, [this](){
        QByteArray data;
        data.resize(2);
        data[0] = 0x3c;
        data[1] = 0xb8;
        sendTcpData(data);
    });
    timerUpdateAssign->start(5000);
}

void NetworkManager::sendTcpData(QByteArray data)
{
    qDebug() << "data Sent:" << data ;
    _pSocket->write(data);
}

void NetworkManager::readTcpData()
{
    QByteArray data = _pSocket->readAll();
}


