params ["_vehicle"];

// TODO: We don't account for boats yet
if(!isTouchingGround _vehicle) exitWith { false; };

private _velocity = velocityModelSpace _vehicle;
private _magnitude = sqrt ((_velocity select 0)^2 + (_velocity select 1)^2 + (_velocity select 2)^2);

if(_magnitude > 0.1) exitWith { false; };

true;
