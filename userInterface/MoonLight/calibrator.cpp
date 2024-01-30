#include "calibrator.h"
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickWindow>

Calibrator::Calibrator(NetworkManager *net):
    mNetworkManager(net)
{

}

void Calibrator::sendCalibrationData()
{
    qDebug() << "jssdkfsdf";
}

void Calibrator::discardCalibration()
{

}

int Calibrator::channel()
{
    return mChannel;
}

void Calibrator::setChannel(int channel)
{
    mChannel = channel;
    qDebug() << mChannel;
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
