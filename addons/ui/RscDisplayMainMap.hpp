class RscText;
class RscDisplayMainMap {
	class controls {
		class GVAR(terrainName) : RscText {
			idc = IRE_MOD_UI_TERRAINNAME;
			text = "";

			x = "30 * ( ((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 *  ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			font = "RobotoCondensedLight";
			colorText[] = {1, 1, 1, 1};
			colorShadow[] = {0, 0, 0, 0.5};
			align = "left";
			shadow = 1;
			sizeEx = "0.8 *  ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
