#include "calibrator.h"
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickWindow>

Calibrator::Calibrator()
{

}

void Calibrator::sendCalibrationData()
{
    qDebug() << mChannel << mPower << mVSUP << mID;
}

void Calibrator::discardCalibration()
{

}

void Calibrator::setNetwork(NetworkManager *net)
{
    mNetworkManager = net;
    qDebug() << "000000";
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
