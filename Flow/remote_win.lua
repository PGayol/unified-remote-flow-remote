local keyboard = libs.keyboard;
local win = libs.win;
local utf8 = libs.utf8;

function FindPlayerWindow(browserClass)
	-- 1. Find all windows for the specified browser window class (i.e. all tabs)
	-- 2. For each "tab" check if the title starts with "Flow" (i.e. a Flow tab)
	local hwnds = win.findall(0, browserClass, nil, false);
	for i,hwnd in ipairs(hwnds) do
		local title = win.title(hwnd);
		print(title);
		if utf8.startswith(title, "Flow") then
			return hwnd;
		end
	end
	return 0;
end

function FindWindow()
	local hwnd = 0;
	-- Check Chrome
	hwnd = FindPlayerWindow("Chrome_WidgetWin_1");
	if (hwnd ~= 0) then 
		print("chrome");
		return hwnd; 
	end
	-- Check FF
	hwnd = FindPlayerWindow("MozillaWindowClass");
	if (hwnd ~= 0) then 
		print("ff");   
		return hwnd; 
	end
	-- Check Edge
	hwnd = FindPlayerWindow("ApplicationFrameWindow");
	if (hwnd ~= 0) then
		print("edge");
		return hwnd;
	end
	return 0;
end

actions.switch = function ()
	local hwnd = FindWindow();
	if (hwnd ~= 0) then
		win.switchto(hwnd);
		os.sleep(100);
		win.switchto(hwnd);
	end
end

--@help Launch Netflix site
actions.launch = function ()
	os.open("https://web.flow.com.ar/guia-de-tv");
end

--@help Lower volume
actions.volume_down = function()
	keyboard.stroke("volumedown");
end

--@help Mute volume
actions.volume_mute = function()
	keyboard.stroke("volumemute");
end

--@help Raise volume
actions.volume_up = function()
	keyboard.stroke("volumeup");
end

--@help Pause playback
actions.pause = function()
	actions.switch();
	keyboard.stroke("next");
end

--@help Toggle playback state
actions.play_pause = function()
	actions.switch();
	keyboard.stroke("space");
end

--@help Channel Up
actions.left = function()
	actions.switch();
	keyboard.stroke("up");
end

--@help Select current item
actions.select = function()
	actions.switch();
	keyboard.stroke("return");
end

--@help Channel Down
actions.right = function()
	actions.switch();
	keyboard.stroke("down");
end

--@help Seek forward
actions.forward = function()
	actions.switch();
	keyboard.stroke("right");  
end

--@help Seek backward
actions.rewind = function()
	actions.switch();
	keyboard.stroke("left");
end

--@help Fullscreen view
actions.fullscreen = function()
	actions.switch();
	keyboard.stroke("shift", "f");
end

--@help Windowed view
actions.window = function()
	actions.switch();
	keyboard.stroke("escape");
	keyboard.stroke("F11");
end

--@help Show onscreen guide
actions.showGuide = function()
	keyboard.stroke("shift", "g")
end

--@help Go live
actions.goLive = function()
	keyboard.stroke("shift", "v")
end

--@help Toggle SAP
actions.changeSAP = function()
	keyboard.stroke("shift", "l")
end

--@help Toggle Subs
actions.changeSubs = function()
	keyboard.stroke("shift", "q")
end

--@help Press zero
actions.num_0 = function ()
	keyboard.press("num0");
end

--@help Press One
actions.num_1 = function ()
	keyboard.press("num1");
end

--@help Press Two
actions.num_2 = function ()
	keyboard.press("num2");
end

--@help Press Three
actions.num_3 = function ()
	keyboard.press("num3");
end

--@help Press Four
actions.num_4 = function ()
	keyboard.press("num4");
end

--@help Press Five
actions.num_5 = function ()
	keyboard.press("num5");
end

--@help Press Six
actions.num_6 = function ()
	keyboard.press("num6");
end

--@help Press Seven
actions.num_7 = function ()
	keyboard.press("num7");
end

--@help Press Eight
actions.num_8 = function ()
	keyboard.press("num8");
end

--@help Press Nine
actions.num_9 = function ()
	keyboard.press("num9");
end