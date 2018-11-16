// The end game scoreboard
class Scoreboard {

    idd = -1;
    movingEnable = false;
    enableSimulation = true;
    enableDisplay = 1;
    name = "Scoreboard";
    onLoad = "with uiNameSpace do { Scoreboard = _this select 0 }";

    class controlsBackground {};
    class objects {};

    class controls { 

        class scoreboardContent
        {
            access = 0;
            type = 0; //  13;
            idc = 1100;
            style = 18; // Center-aligned, multiple-line text box
            lineSpacing = 1;
            x = 0.0;
            y = 0.2;
            w = 1;
            h = 0.5;
            size = 0.020;
            sizeEx = 0.05;
            colorBackground[] = {0,0,0,.5};
            colorText[] = {1,1,1,1};
            text = "";
            font = "PuristaSemiBold";
        };

        class close
        {
            access = 0;
            type = 0; //  13;
            idc = 1200;
            style = 18; // Center-aligned, multiple-line text box
            lineSpacing = 1;
            x = -0.09;
            y = 0.2;
            w = .3;
            h = 0.5;
            size = 0.020;
            sizeEx = 0.03;
            colorBackground[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
            text = "esc to close";
            font = "PuristaSemiBold";
        };

    };
};


// HUD container class
class RscTitles
{
    class Default 
    {
       idd = -1;
       fadein = 0;
       fadeout = 0;
       duration = 0;
    };

    // The HUD on the left side of the screen
    class CQCHUD
    {
        idd = 1000000;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 999999;
        fadein = .1;
        fadeout =  2;
        name = "CQCHUD";
		onLoad = "with uiNameSpace do { CQCHUD = _this select 0 }";
	   
       // HUD Section Controls
        class controls 
        {
		  
            class healthText
            {
                access = 0;
                type = 0; // 13;
                idc = 1002;
                style = 0; // Left-aligned text
                lineSpacing = 1;
                x = 0.96 * safezoneX;
                y = 0.6 * safezoneH + safezoneY;
                w = 0.2;
                h = 0.07;
                size = 0.020;
                sizeEx = 0.05;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,1,1,1};
                text = "Health: 100%";
                font = "PuristaSemiBold";
            };

            class scoreText
            {
                access = 0;
                type = 0; // 13;
                idc = 1001;
                style = 0; // Left-aligned text
                lineSpacing = 1;
                x = 0.96 * safezoneX;
                y = 0.625 * safezoneH + safezoneY;
                w = 0.2;
                h = 0.07;
                size = 0.020;
                sizeEx = 0.05;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,1,1,1};
                text = "Score: 0";
                font = "PuristaSemiBold";
            }; 

            class enemiesText
            {
                access = 0;
                type = 0; // 13;
                idc = 1003;
                style = 0; // Left-aligned text
                lineSpacing = 1;
                x = 0.96 * safezoneX;
                y = 0.65 * safezoneH + safezoneY;
                w = 0.25;
                h = 0.07;
                size = 0.020;
                sizeEx = 0.05;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,1,1,1};
                text = "Enemies: 0";
                font = "PuristaSemiBold";
            };

            class hostagesText
            {
                access = 0;
                type = 0; // 13;
                idc = 1005;
                style = 0; // Left-aligned text
                lineSpacing = 1;
                x = 0.96 * safezoneX;
                y = 0.675 * safezoneH + safezoneY;
                w = 0.25;
                h = 0.07;
                size = 0.020;
                sizeEx = 0.05;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,1,1,1};
                text = "Hostages: 0";
                font = "PuristaSemiBold";
            };           

            class accuracyText
            {
                access = 0;
                type = 0; // 13;
                idc = 1006;
                style = 0; // Left-aligned text
                lineSpacing = 1;
                x = 0.96 * safezoneX;
                y = 0.7 * safezoneH + safezoneY;
                w = 0.25;
                h = 0.07;
                size = 0.020;
                sizeEx = 0.05;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,1,1,1};
                text = "Accuracy: 100%";
                font = "PuristaSemiBold";
            };

            class timerText
            {
                access = 0;
                type = 0; // 13;
                idc = 1004;
                style = 0; // Left-aligned text
                lineSpacing = 1;
                x = 0.96 * safezoneX;
                y = 0.725 * safezoneH + safezoneY;
                w = 0.25;
                h = 0.07;
                size = 0.020;
                sizeEx = 0.05;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,1,1,1};
                text = "Time: 00:00";
                font = "PuristaSemiBold";
            };

		};
	};
};