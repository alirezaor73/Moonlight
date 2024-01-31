#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "application.h"

#include <QMetaMethod>
#include <QObject>
#include <QThread>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Application application;

    return app.exec();
}
