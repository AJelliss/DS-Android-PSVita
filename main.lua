-- initialize network system
Network.init()
Keyboard.start("Enter IP Address","your_IP"
keyboardFinishBool = true
andr_IP = nil
open_sock = nil
andr_port = 12345
vita_port = 54321

while keyboardFinishBool do
    Graphics.initBlend()
    Screen.clear()

    status = Keyboard.getState()
    if status ~= RUNNING then
	if status ~= CANCELED then
	    andr_IP = Keyboard.getInput()
	    keyboard
	else 
	    -- what should we do if canceled?
	end

	Keyboard.clear()
	keyboardFinishBool = false
    end
end

-- Establish Connections to Android Device. 
if Network.isWifiEnabled() then
    andr_sock = Socket.connect(andr_IP, andr_port, UDP_SOCKET)
    open_sock = Socket.createServerSocket(vita_port, TCP_SOCKET)


