import QtQuick 2.7
import SddmComponents 2.0

Rectangle 
{
    id: container
	width: Screen.width
	height: Screen.height
    TextConstants { id: textConstants }

    Connections 
    {
        target: sddm

        onLoginSucceeded: {
            errorMessage.color = "white"
            errorMessage.text = textConstants.loginSucceded
        }

        onLoginFailed: {
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
        }
    }    
    
    Component.onCompleted: 
    {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
	}    
        
	Background 
	{
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
    }
                 
    
    //
	// top left panel
	//
	
	Row 
	{
		anchors.top: parent.top
		anchors.left: parent.left
		width: parent.width
		spacing: 20
		height: 30

		ImageButton 
		{
			anchors.verticalCenter: parent.verticalCenter
			width: 50
			id: poweroff
			source: "shutdown.svg"
			onClicked: sddm.poweroff()
			KeyNavigation.backtab: loginButton; KeyNavigation.tab: reboot
		}			
		
		ImageButton 
		{
			anchors.verticalCenter: parent.verticalCenter
			width: 50
			id: reboot
			source: "reboot.svg"
			onClicked: sddm.reboot()
			KeyNavigation.backtab: poweroff; KeyNavigation.tab: session
		}			

		ComboBox 
		{
			textColor: "#333333"
			borderColor: "transparent"
			color: "transparent"
			arrowColor: "transparent"
			font.family: Monospace						
			id: session
			height: 24
			arrowIcon: "angle-down.png"
			font.pixelSize: 13
			
			model: sessionModel
			index: sessionModel.lastIndex
			anchors.verticalCenter: parent.verticalCenter
			KeyNavigation.backtab: reboot; KeyNavigation.tab: name
		}
		
	} // row


	//
	// top right panel
	//
	
	Rectangle
	{
		height: 30
		width: 200
		color: "transparent"
		anchors.top: parent.top
		anchors.right: parent.right
		
		Text 
		{
			anchors.verticalCenter: parent.verticalCenter
			anchors.right: parent.right				
			text: Qt.formatDateTime(new Date(), "d MMMM HH:mm") + "  "
			color: "#ffffff"
			font.pixelSize: 12
			font.family: Monospace
			
		}
	}


	//
	// login box
	//
		
	Rectangle
	{
		width: 250
		height: 150
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		color: "#000000"
		opacity: 0.6
		radius: 2
	}    

	Column 
	{ 
		width: 200
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		spacing: 10
								
		TextBox 
		{
			id: name
			width: parent.width; height: 30
			text: userModel.lastUser
			font.family: Monospace
			font.pixelSize: 13
			radius: 2.0
			KeyNavigation.backtab: session; KeyNavigation.tab: password
			
			Keys.onPressed: {
				if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
					sddm.login(name.text, password.text, session.index)
					event.accepted = true
				}
			}
		}
		
		TextBox 
		{
			id: password
			width: parent.width; height: 30
			font.family: Monospace
			font.pixelSize: 13
			radius: 2.0
			echoMode: TextInput.Password
			KeyNavigation.backtab: name; KeyNavigation.tab: loginButton

			Keys.onPressed: {
				if (event.key === Qt.Key_Return) {
					sddm.login(name.text, password.text, session.index)
					event.accepted = true
				}
			}
		}  			 
 
		Button 
		{
			width: parent.width
			id: loginButton
			color: "#0088dd"
			text: textConstants.login
			activeColor: "#0088cc"
			borderColor: "#333333"
			radius: 2.0
			font.family: Monospace
			font.pixelSize: 13
			font.bold: false	

			onClicked: sddm.login(name.text, password.text, session.index)

			KeyNavigation.backtab: password; KeyNavigation.tab: shutdownButton
		}		
		
		Text 
		{
			id: errorMessage
			color: "#0088cc"
			font.pixelSize: 12
		}		
					
	} // column 
	
}