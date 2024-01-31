#include "networkmanager.h"
#include "QTimer"

NetworkManager::NetworkManager() {

}

void NetworkManager::connectTcp()
{

    _pSocket = new QTcpSocket( this );
    connect( _pSocket, &QTcpSocket::readyRead ,this , &NetworkManager::readTcpData);

    _pSocket->connectToHost("127.0.0.1", 6666);
    if( _pSocket->waitForConnected() ) {
        qDebug() << "client connected";
    }
}

void NetworkManager::sendTcpData(QByteArray *data)
{
    QDataStream stream(data,QIODevice::ReadOnly);
    for (int var = 0; var < data->length()/4; ++var) {
        int rData;
        stream >> rData;
        qDebug() << "data Sent:" << rData;
    }
    _pSocket->write(data->constData(), data->length());
    _pSocket->flush();

}

void NetworkManager::readTcpData()
{
    QByteArray data = _pSocket->readAll();
    QDataStream stream(&data,QIODevice::ReadOnly);
    for (int var = 0; var < data.length()/4; ++var) {
        int rData;
        stream >> rData;
        qDebug() << "data Received:" << rData;
    }
}


