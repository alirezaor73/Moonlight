/****************************************************************************
** Meta object code from reading C++ file 'calibrator.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.6.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../MoonLight/calibrator.h"
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'calibrator.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.6.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSCalibratorENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSCalibratorENDCLASS = QtMocHelpers::stringData(
    "Calibrator",
    "dataChanged",
    "",
    "sendCalibrationData",
    "discardCalibration",
    "channel",
    "power",
    "vSUP",
    "iD"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSCalibratorENDCLASS_t {
    uint offsetsAndSizes[18];
    char stringdata0[11];
    char stringdata1[12];
    char stringdata2[1];
    char stringdata3[20];
    char stringdata4[19];
    char stringdata5[8];
    char stringdata6[6];
    char stringdata7[5];
    char stringdata8[3];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSCalibratorENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSCalibratorENDCLASS_t qt_meta_stringdata_CLASSCalibratorENDCLASS = {
    {
        QT_MOC_LITERAL(0, 10),  // "Calibrator"
        QT_MOC_LITERAL(11, 11),  // "dataChanged"
        QT_MOC_LITERAL(23, 0),  // ""
        QT_MOC_LITERAL(24, 19),  // "sendCalibrationData"
        QT_MOC_LITERAL(44, 18),  // "discardCalibration"
        QT_MOC_LITERAL(63, 7),  // "channel"
        QT_MOC_LITERAL(71, 5),  // "power"
        QT_MOC_LITERAL(77, 4),  // "vSUP"
        QT_MOC_LITERAL(82, 2)   // "iD"
    },
    "Calibrator",
    "dataChanged",
    "",
    "sendCalibrationData",
    "discardCalibration",
    "channel",
    "power",
    "vSUP",
    "iD"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSCalibratorENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       4,   35, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   32,    2, 0x06,    5 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       3,    0,   33,    2, 0x02,    6 /* Public */,
       4,    0,   34,    2, 0x02,    7 /* Public */,

 // signals: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
       5, QMetaType::Int, 0x00015903, uint(0), 0,
       6, QMetaType::Int, 0x00015903, uint(0), 0,
       7, QMetaType::Int, 0x00015903, uint(0), 0,
       8, QMetaType::Int, 0x00015903, uint(0), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject Calibrator::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSCalibratorENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSCalibratorENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSCalibratorENDCLASS_t,
        // property 'channel'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'power'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'vSUP'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'iD'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<Calibrator, std::true_type>,
        // method 'dataChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'sendCalibrationData'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'discardCalibration'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void Calibrator::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Calibrator *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->dataChanged(); break;
        case 1: _t->sendCalibrationData(); break;
        case 2: _t->discardCalibration(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Calibrator::*)();
            if (_t _q_method = &Calibrator::dataChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
    } else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Calibrator *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->channel(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->power(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->vSUP(); break;
        case 3: *reinterpret_cast< int*>(_v) = _t->iD(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Calibrator *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setChannel(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setPower(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setVSUP(*reinterpret_cast< int*>(_v)); break;
        case 3: _t->setID(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
    (void)_a;
}

const QMetaObject *Calibrator::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Calibrator::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSCalibratorENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Calibrator::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 3;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void Calibrator::dataChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
