#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "networkmanager.h"
#include "calibrator.h"
#include "qqmlcomponent.h"

#include <QMetaMethod>
#include <QObject>
#include <QThread>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);





    qmlRegisterType<Calibrator>("CalIns",1,0,"Calibrator");
    //--load qml engine---------------------------------------------
    QQmlApplicationEngine *engine = new QQmlApplicationEngine;

    QQmlComponent* comp = new QQmlComponent(engine);
    comp->loadUrl(QUrl("qrc:/Main.qml"));
    comp->create();


    //--initialize network------------------------------------------
    NetworkManager *network = new NetworkManager;
    network->connectTcp();


    //--set Calibrator instance----------------------------------
    Calibrator *calibrator = new Calibrator;
    engine->rootContext()->

    //------------------------------------------------------

    // comp->setProperty("calIns" , calibrator);

    return app.exec();
}
