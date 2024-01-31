#ifndef CALIBRATOR_H
#define CALIBRATOR_H

#include "networkmanager.h"

class Calibrator
{
    Q_PROPERTY(int channel READ channel WRITE setChannel NOTIFY dataChanged FINAL)
    Q_PROPERTY(int power   READ power   WRITE setPower   NOTIFY dataChanged FINAL)
    Q_PROPERTY(int vSUP    READ vSUP    WRITE setVSUP    NOTIFY dataChanged FINAL)
    Q_PROPERTY(int iD      READ iD      WRITE setID      NOTIFY dataChanged FINAL)

public:
    Calibrator(NetworkManager *net);
    Q_INVOKABLE void sendCalibrationData();
    Q_INVOKABLE void discardCalibration();

    int channel();
    void setChannel(int channel);
    int power();
    void setPower(int channel);
    int vSUP();
    void setVSUP(int channel);
    int iD();
    void setID(int channel);

signals:
    void dataChanged();

private:
    NetworkManager* mNetworkManager{nullptr};
    int mChannel = 0;
    int mPower = 0;
    int mVSUP = 0;
    int mID = 0 ;
};

#endif // CALIBRATOR_H
