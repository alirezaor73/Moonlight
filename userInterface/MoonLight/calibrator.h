#ifndef CALIBRATOR_H
#define CALIBRATOR_H

#include "networkmanager.h"
#include "qobject.h"

class Calibrator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int channel READ channel WRITE setChannel NOTIFY dataChanged FINAL)
    Q_PROPERTY(int power   READ power   WRITE setPower   NOTIFY dataChanged FINAL)
    Q_PROPERTY(int vSUP    READ vSUP    WRITE setVSUP    NOTIFY dataChanged FINAL)
    Q_PROPERTY(int iD      READ iD      WRITE setID      NOTIFY dataChanged FINAL)

public:

    Calibrator();
    Q_INVOKABLE void sendCalibrationData();
    Q_INVOKABLE void discardCalibration();
    void setNetwork(NetworkManager *net);

    int channel();
    void setChannel(int channel);
    int power();
    void setPower(int power);
    int vSUP();
    void setVSUP(int vsup);
    int iD();
    void setID(int id);

signals:
    void dataChanged();

private:
    NetworkManager* mNetworkManager{nullptr};
    int mChannel = 450;
    int mPower = 1000;
    int mVSUP = 0;
    int mID = 0 ;
};

#endif // CALIBRATOR_H
