import QtQuick 2.1
import org.kde.kirigami 2.2 as Kirigami
import QtQuick.Controls 2.0 as Controls
import QtMultimedia 5.8 as MultiMedia

Kirigami.ApplicationWindow {
    id: root

    title: "Torch"

    pageStack.initialPage: mainPageComponent

    Component {
        id: mainPageComponent

        Kirigami.Page {
            title: "Torch"

            Rectangle {
                color: "black"
                anchors.fill: parent

                Column {
                    anchors.centerIn: parent

                    Controls.Switch {
                        id: torchSwitch
                        checked: false

                        onCheckedChanged: {
                            if (checked) {
                                camera.flash.mode = MultiMedia.Camera.FlashOn
//                                torch.enabled = true
                            }
                            else {
                                camera.flash.mode = MultiMedia.Camera.FlashOff
//                                torch.enabled = false
                            }
                            console.log ("Checked: " + checked)
                        }
                    }
                }
            }
        }
    }

//    MultiMedia.Torch {
//        id: torch

//        power: 50       // 50% of full power
//        enabled: false // On
//    }

    MultiMedia.Camera {
        id: camera

        flash.mode: MultiMedia.Camera.FlashOff

        flash {
            id: cameraFlash

            onFlashModeChanged: console.log ("Flash Mode: " + flash.mode)
        }
    }

}


