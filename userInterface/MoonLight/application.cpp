#include "application.h"
#include "calibrator.h"
#include "networkmanager.h"
#include "qqmlapplicationengine.h"
#include <QQmlContext>

Application::Application() {

    //--initialize network-------------------------------------------
    NetworkManager *network = new NetworkManager;
    network->connectTcp();
    //--load qml engine----------------------------------------------
    QQmlApplicationEngine *engine = new QQmlApplicationEngine;
    //-- initialize calibrator ---------------------------------------
    Calibrator *calibrator = new Calibrator;
    calibrator->setNetwork(network);
    engine->rootContext()->setContextProperty(QStringLiteral("calib"), QVariant::fromValue<Calibrator*>(calibrator));
    //--Load qml ----------------------------------------------
    engine->load(QUrl("qrc:/Main.qml"));

}
