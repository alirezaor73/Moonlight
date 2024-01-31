#include "calibrator.h"
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickWindow>

Calibrator::Calibrator()
{

}

void Calibrator::sendCalibrationData()
{
    QByteArray* array = new QByteArray;
    QDataStream stream(array,QIODevice::WriteOnly);
    int header = 0;
    stream << header << mChannel << mPower << mVSUP << mID;
    mNetworkManager->sendTcpData(array);
}

void Calibrator::discardCalibration()
{

}

void Calibrator::setNetwork(NetworkManager *net)
{
    mNetworkManager = net;
}

int Calibrator::channel()
{
    return mChannel;
}

void Calibrator::setChannel(int channel)
{
    mChannel = channel;
}

int Calibrator::power()
{
    return mPower;
}

void Calibrator::setPower(int power)
{
    mPower = power;
}

int Calibrator::vSUP()
{
    return mVSUP;
}

void Calibrator::setVSUP(int vsup)
{
    mVSUP = vsup;
}

int Calibrator::iD()
{
    return mID;
}

void Calibrator::setID(int id)
{
    mID = id;
}
