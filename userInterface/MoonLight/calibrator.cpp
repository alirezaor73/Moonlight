#include "calibrator.h"
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickWindow>

Calibrator::Calibrator(NetworkManager *net, QQmlEngine *engine):
    mNetworkManager(net)
{

}
