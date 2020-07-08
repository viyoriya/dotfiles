#ifndef CONFIG_H
#define CONFIG_H

#define MOD Mod4Mask

#define PANEL_HEIGHT    18
#define BORDER_COLOR    "#956671"
#define BORDER_WIDTH    1
#define DESKTOPS        10

const char dmenufont[]       = "Iosevka:style=Bold:pixelsize=12"; 
const char col_gray1[]       = "#2E3440";
const char col_gray2[]       = "#4C566A";
const char col_gray3[]       = "#929496"; 
const char col_gray4[]       = "#010b13"; 
const char col_cyan[]        = "#7d7f82"; 

const char* dmenucmd[]		= { "dmenu_run", "-p", "Find", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, 0 };
const char* termcmd[]       = { "st",0};
const char* chromecmd[]     = { "google-chrome-stable", 0 };
const char* rangercmd[]     = { "st","-e","ranger", 0 };
const char* nvimcmd[]       = { "st","-e","nvim", 0 };
const char* firefoxcmd[]  	= { "firefox",0};
const char* rofiruncmd[]    = { "rofi","-show","drun", 0 };
const char* rofiwindowcmd[] = { "rofi","-show","window", 0 };
const char* volumeUp[]    	= {	"amixer","sset","Master","5%+",0};
const char* volumeDown[]  	= {	"amixer","sset","Master","5%-",0};

#define CMD(cmd){ .com = (const char* []){ "/bin/sh", "-c", cmd, 0}}

#define DESKTOPCHANGE(K,N) \
    { MOD,             K,     ws_go,      {.i = N}}, \
    { MOD|ShiftMask,   K,     win_to_ws,  {.i = N}},

static struct key keys[] = {
    {MOD,      		  XK_q,   		win_kill,   	{0}},
    {MOD,      		  XK_c,   		win_center, 	{0}},
    {MOD,      		  XK_f,   		win_fs,     	{0}},

    {MOD,             XK_Tab,		win_next,       {0}},
    {MOD,             XK_Left,      ws_rotate,      {.i=-1}},
    {MOD,             XK_Right,     ws_rotate,      {.i=+1}},    
    {MOD,             XK_F2,        run,          	{.com = chromecmd}},
    {MOD,             XK_F3,        run,          	{.com = rangercmd}},   
    {MOD,             XK_F4,        run,          	{.com = nvimcmd}},       
    {MOD,             XK_F5,        run,          	{.com = firefoxcmd}},    
    {MOD,             XK_Return,    run,          	{.com = termcmd}},
    {MOD,             XK_r,         run,          	{.com = rofiruncmd}},
    {MOD,             XK_w,         run,          	{.com = rofiwindowcmd}},
    {MOD,             XK_p,         run,          	{.com = dmenucmd}},
    {MOD|ShiftMask,   XK_p,         run,            CMD("~/.config/sowm/dmenu_stat.sh")},
    {MOD,             XK_F1,        run,          	{.com = volumeUp}},
    {MOD|ShiftMask,   XK_F1,        run,         	{.com = volumeDown}},            
	{MOD,       	  XK_Print,  	run,          	CMD("~/.config/sowm/screenshot.sh")},
	{MOD|ShiftMask,   XK_Print,  	run,          	CMD("~/.config/sowm/screenshot-w.sh")},	
    {MOD,             XK_0,         run,          	CMD("~/.config/sowm/power-menu.sh")},
    {MOD|ShiftMask,   XK_q,         sowmkill,       {0}},
    {MOD|ShiftMask,   XK_c,         run,            CMD("compton -e 0.92 -o 0.92 -b")},
    {MOD|Mod1Mask,	  XK_c,         run,          	CMD("killall compton")},
    DESKTOPCHANGE(    XK_1,							1)
    DESKTOPCHANGE(    XK_2,                         2)
    DESKTOPCHANGE(    XK_3,                         3)
    DESKTOPCHANGE(    XK_4,                         4)
    DESKTOPCHANGE(    XK_5,                         5)
    DESKTOPCHANGE(    XK_6,                         6)
    DESKTOPCHANGE(    XK_7,                         7)
    DESKTOPCHANGE(    XK_8,                         8)
    DESKTOPCHANGE(    XK_9,                         9)

};

#endif
