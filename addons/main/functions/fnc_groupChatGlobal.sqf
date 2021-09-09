params ["_unitName", "_chatText"];
[_unitName, _chatText] remoteExec ["groupChat", 0, false];
