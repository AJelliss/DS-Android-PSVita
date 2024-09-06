local msgpack = require("MessagePack")
-- initialize network system
Network.init()
Keyboard.start("Enter IP Address","your_IP")
keyboardFinishBool = true
andr_IP = nil
open_sock = nil
andr_sock = nil
andr_port = 12345
vita_port = 54321
RTP_PACKETS = {}

function receiveRTP()
    while true do 
	inRTP = Socket.receive(andr_sock, 1500)
	table.insert(RTP_PACKETS, inRTP)
    end 
end

function assembleAndDisplay()
    while true do
	-- this should be done with C. 
    end
end

function inputSend()
    while true do 
	local buttons = Controls.read()
	local lx, ly = Controls.readLeftAnalog()
	local rx, ry = Controls.readRightAnalog()
	local tx, ty = Controls.readTouch()
	local inputData = {buttons,lx,ly,rx,ry,tx,ty}
	local packedInput = msgpack.pack(inputData)
	Socket.send(open_sock, packedInput)
    end
end


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
print(


