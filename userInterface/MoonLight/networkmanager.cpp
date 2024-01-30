#include "networkmanager.h"
#include "QTimer"

NetworkManager::NetworkManager() {

}

void NetworkManager::connectTcp()
{

    _pSocket = new QTcpSocket( this ); // <-- needs to be a member variable: QTcpSocket * _pSocket;
    connect( _pSocket, &QTcpSocket::readyRead ,this , &NetworkManager::readTcpData);

    _pSocket->connectToHost("127.0.0.1", 6666);
    if( _pSocket->waitForConnected() ) {
        qDebug() << "client connected";
    }

    QTimer *timerUpdateAssign = new QTimer();
    QObject::connect(timerUpdateAssign, &QTimer::timeout, [this](){
        QByteArray *data = new QByteArray;
        data->resize(2);
        data[0].setNum(2);
        sendTcpData(data);
    });
    timerUpdateAssign->start(5000);
}

void NetworkManager::sendTcpData(QByteArray *data)
{
    qDebug() << "data Sent:" << data[0].toInt() ;
    //send int and float data through socket
    std::string str = "salam";
    _pSocket->write(str.c_str());
    _pSocket->write(data->constData(), data->length());
    _pSocket->flush();

}

void NetworkManager::readTcpData()
{
    QByteArray data = _pSocket->readAll();
    qDebug() << "Data Received:" << data ;
}


