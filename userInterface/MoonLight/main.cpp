#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "networkmanager.h"
#include "calibrator.h"
#include "qqmlcomponent.h"
#include <QThread>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

//--initialize network------------------------------------------
    NetworkManager *network = new NetworkManager;
    network->connectTcp();

//--load qml engine---------------------------------------------
    QQmlEngine *engine = new QQmlEngine;
    QQmlComponent* comp = new QQmlComponent(engine);
    comp->loadUrl(QUrl("qrc:/Main.qml"));
    // qmlRegisterType<Calibrator>("CalIns",1,0,"Calibrator");

    //--set Calibrator instance----------------------------------
    Calibrator* calibrator = new Calibrator(network);


    // comp->setProperty("calIns" , calibrator);

    return app.exec();
}
