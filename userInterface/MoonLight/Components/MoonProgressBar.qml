import QtQuick
import QtQuick.Controls

Item{
    id:root

    property double progressDuration: 10.0

    function start(){
        forward.start()
        forward.resume()
    }

    function pause(){
        forward.pause()
    }

    function reset(){
        forward.pause()
        progressbar.width = 0
        forward.restart()
        forward.pause()
    }


    width: 407
    height: 16
    Rectangle {
        id:backGround
        width: parent.width
        height: parent.height
        color: "#8897B27E"
        radius: root.height
    }
    Rectangle{
        id:progressbar
        anchors.left: backGround.left
        height: parent.height
        width: 0
        color: "#97B27E"
        radius: root.height
    }

    PropertyAnimation{
        id:forward
        target: progressbar
        properties: "width"
        to: backGround.width
        duration: root.progressDuration * 1000
    }
}
