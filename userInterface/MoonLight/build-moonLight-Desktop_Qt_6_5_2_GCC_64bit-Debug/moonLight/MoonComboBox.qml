import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ComboBox {
    id: stepCombobox
    Layout.alignment: Qt.AlignVCenter
    Layout.preferredHeight: 56
    Layout.preferredWidth: 205
    model: [1000, 100, 10, 1, 0.1, 0.05, 0.01]
    currentIndex: 0
    font.pointSize: 10
    displayText: model[currentIndex].toString()

    contentItem: Text {
        text: stepCombobox.displayText
        color: "white"
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
    }

    background: Rectangle {
        color: "#4D586C"
        radius: 10
        // IconImage {
        //     width: 15
        //     height: 15
        //     source: "qrc:/Resources/down.png"
        //     anchors.right: parent.right
        //     anchors.verticalCenter: parent.verticalCenter
        //     z: 3
        // }
    }
    indicator: Item {}
}
