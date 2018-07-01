import QtQuick 2.1
import org.kde.kirigami 2.2 as Kirigami
import QtQuick.Controls 2.0 as Controls
import QtMultimedia 5.8 as Multimedia

Kirigami.ApplicationWindow {
    id: root

    title: "Torch"
    pageStack.initialPage: mainPageComponent

    Component {
        id: mainPageComponent

        Kirigami.Page {
            id: torchPage

            property bool flashlightOn : torchSwitch.checked

            title: "Torch"

            onFlashlightOnChanged: {
                 if(flashlightOn) {
                     console.log("Flash light switch: checked")
                     camera.flashlightOn = true
                 } else {
                     console.log("Flash light switch: unchecked")
                     camera.flashlightOn = false
                 }
            }

            Rectangle {
                id: window

                color: "black"
                anchors.fill: parent

                Column {
                    anchors.centerIn: parent

                    Controls.Switch {
                        id: torchSwitch

                        checked: false

                    }
                }
            }
        }
    }

//    Multimedia.Torch {
//        id: torch

//        power: 50       // 50% of full power
//        enabled: false // On
//    }

    Multimedia.Camera {
        id: camera

        property bool flashlightOn: false

        flash.mode: Multimedia.Camera.FlashOff

        flash.onReadyChanged: {
            console.log("Flash ready changed: " + flash.ready)
        }

        flash.onModeChanged: {
            console.log("Flash mode changed: " + flash.mode)
        }

        onLockStatusChanged: {
            console.log("Lock status changed: " + lockStatus)
        }

        onCameraStatusChanged: {
            console.log("Camera status changed: " + cameraStatus)
        }

        onFlashlightOnChanged: {
            console.log("Camera flash light property " + flashlightOn)
            if (flashlightOn) {
                flash.mode = Multimedia.Camera.FlashVideoLight
            }
            else {
                flash.mode = Multimedia.Camera.FlashOff
            }
        }

        onCameraStateChanged: {
            console.log("Camera state changed: " + cameraState)
        }

        onCaptureModeChanged: {
            console.log("Capture mode changed: " + captureMode)
        }

        onErrorStringChanged: {
            console.log("Camera error: " + errorString)
        }

        Component.onCompleted: {
            console.log("Camera init state: ")
            console.log("Flash ready: " + flash.ready)
            console.log("Flash mode: " + flash.mode)
            console.log("Camera status: " + cameraStatus)
            console.log("Camera state: " + cameraState)
            console.log("Capture mode: " + captureMode)
            console.log("Lock status: "+ lockStatus)
        }
    }
}


