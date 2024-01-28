import QtQuick
import QtQuick.Controls
import QtQuick.Effects


Switch {
    id: control
    width: 52
    height: 31
    indicator: PaddedRectangle {
        width: 52
        height: 31
        color: "#E0E0E0"
        radius: height/2

        Rectangle {
            id: toggleBtn
            x: Math.max(3, Math.min(parent.width - width, control.visualPosition * parent.width - (width / 2)) -3)
            y: (parent.height - height) / 2
            width: 27
            height: 27
            radius: height/2
            color: "white"
            MultiEffect{
                source: toggleBtn
                anchors.fill: toggleBtn
                shadowEnabled: true
                shadowColor: "black"
                shadowBlur: 0.8
                shadowOpacity: 0.3
                shadowScale: 1.2
            }

            Behavior on x {
                enabled: !control.down
                SmoothedAnimation { velocity: 200 }
            }
        }
    }
}
