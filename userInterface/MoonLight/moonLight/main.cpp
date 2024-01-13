#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "networkmanager.h"
#include <QThread>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    NetworkManager *network = new NetworkManager;
    network->connectTcp();

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/moonLight/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);


    return app.exec();
}
