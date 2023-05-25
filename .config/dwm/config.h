/* See LICENSE file for copyright and license details. */

/* for XF86 Media Keys */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 4;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

//static const char *fonts[]          = { "Iosevka:style=Bold:pixelsize=12;-3","Font Awesome 6 Brands Regular:style=Regular:size=9","Font Awesome 6 Free Solid:style=Solid:size=9","Noto Sans Tamil:style=Regular:size=9" }; 
static const char *fonts[]          = { 
                                        "Iosevka:style=Regular:size=9",
                                        //"Iosevka:style=Bold:pixelsize=12;-3", // "Iosevka:style=Regular:size=9",
                                        "Font Awesome 6 Brands Regular:style=Regular:size=9",
                                        "Font Awesome 6 Free Solid:style=Solid:size=9",
                                        "Font Awesome 6 Free Regular:style=Regular:size=9",
                                        "Noto Sans Tamil:style=Regular:size=10" 
                                    }; 
//static const char *fonts[]          = { "Terminus (TTF):style=Bold:size=11","Font Awesome 6 Brands Regular:style=Regular:size=9","Font Awesome 6 Free Solid:style=Solid:size=9","Noto Sans Tamil:style=Regular:size=9" }; 

static const char dmenufont[]       = "Iosevka:style=Regular:size=10";
//static const char dmenufont[]       = "monospace:size=10";

static const char col_gray1[]       = "#1a1d23"; // "#1F222D"; // "#2E3440"; 
static const char col_gray2[]       = "#828486"; 
static const char col_red[]         = "#956671";
static const char col_border[]      = "#1F80E0"; // "#5E81AC";

static const char col_title[]       = "#81a1c1"; // "#1F80E0"; // "#62FF00";

static const char *colors[][3]      = {
	//                   fg          bg         border   
	[SchemeNorm]   = { col_gray2, col_gray1, col_gray1 },
	[SchemeSel]    = { col_gray1, col_gray2, col_red  },
	[SchemeTitle]  = { col_title, col_gray1, col_red },
};

/* tagging */
static const char *tags[] = { "  I", " II", "III", "IV", "V", "VI", "VII", "VIII", "IX " };
//static const char *tags[] = { "  அ ", " ஆ  ", " இ ", " ஈ", " உ ", " ஊ  ", " எ ", " ஏ ", " ஐ " };

#include "tagcycle.c"

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class          instance      title     tags mask  isfloating   monitor */
//	{ "tabbed",         "tabbed",   "st",       0,          0,          -1 },
//	{ "tabbed",         NULL,       NULL,       1 << 1,     0,          -1 },
	{ "VSCodium",       NULL,       NULL,       1 << 2,     0,          -1 },
	{ "firefox",        NULL,       NULL,       1 << 3,     0,          -1 },
	{ "Brave-browser",  NULL,       NULL,       1 << 4,     0,          -1 },

};

/* layout(s) */
static const float mfact        = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1;    /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "",		tile },    /* first entry is default */
	{ "",		NULL },    /* no layout function means floating behavior */
	{ "",		monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
//#define MOD4KEY Mod4Mask

#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] 			= 	"0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]		= { "dmenu_run","-p","     Find ","-m", dmenumon,"-fn",dmenufont,"-nb", col_gray1, "-nf", col_gray2, "-sb", col_gray2, "-sf", col_gray1, NULL };

static const char *tabbedcmd[]  	= { "tabbed","-cr","2","-p","-1","st","-w","''", NULL };
static const char *termcmd[]  		= { "st", NULL };

static const char *pulsemixercmd[]  = { "st","-e","pulsemixer", NULL };
static const char *tmuxcmd[]    	= { "st","-e","tmux", NULL };
static const char *vscodecmd[]    	= { "codium", NULL };
static const char *fmcmd[]          = { "st","-e","sfm", NULL };
static const char *firefoxcmd[]  	= { "firefox",NULL};
static const char *bravecmd[]  	    = { "brave",NULL};


static const char *scrbgtUp[]    	= {	"xbacklight", "-inc", "10", NULL};
static const char *scrbgtDown[]    	= {	"xbacklight", "-dec", "10", NULL};
static const char *volumeUp[]    	= {	"amixer","sset","Master","10%+",  NULL};
static const char *volumeDown[]  	= {	"amixer","sset","Master","10%-",  NULL};
static const char *volumeMute[]  	= {	"amixer","sset","Master","toggle",NULL};
//static const char *volumeMicMute[]  = {	"amixer","sset","Mic",   "toggle",NULL};

static Key keys[] = {
	/* modifier                     key        function        argument */
    { MODKEY|ShiftMask,             XK_Return, spawn,          {.v = tabbedcmd  } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd    } },
    { MODKEY,                       XK_F1,     spawn,          {.v = pulsemixercmd } },
    { MODKEY,                       XK_F2,     spawn,          {.v = tmuxcmd } },
    { MODKEY,                       XK_F3,     spawn,          {.v = vscodecmd  } },
	{ MODKEY,                       XK_F4,     spawn,          {.v = fmcmd  } },
	{ MODKEY,                       XK_F5,     spawn,          {.v = firefoxcmd } },
	{ MODKEY,                       XK_F6,     spawn,          {.v = bravecmd } },
    { MODKEY,                       XK_b,      togglebar,      {0} },
    { MODKEY,                       XK_c,      center,         {0} },
    { MODKEY,           			XK_d,      incnmaster,     {.i = -1 } },
    { MODKEY,			            XK_i,      incnmaster,     {.i = +1 } },
//	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
//	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
    { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
    { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY,                       XK_p,      spawn,          {.v = dmenucmd   } },
    { MODKEY,			            XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_r,      spawn,          SHCMD("xdg-xmenu") },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
    { MODKEY,                       XK_v,      view,           {0} },
    { MODKEY,                       XK_z, 	   zoom,           {0} },
    { MODKEY,                       XK_Tab,    focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_d,      spawn,          SHCMD("dls") },
    { MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY|ShiftMask,             XK_t,      tag,            {.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_v,      view,           {.ui = ~0 } },
	{ MODKEY,              			XK_Right,  shiftview,  	   {.i = +1 } },
	{ MODKEY,              			XK_Left,   shiftview,  	   {.i = -1 } },
    { MODKEY,       				XK_0,      spawn,          SHCMD("~/.config/dwm/util/dwm_power_menu.sh") },
    { MODKEY,       				XK_Print,  spawn,          SHCMD("~/.config/dwm/util/kb_screenshot.sh") },
    { MODKEY|ShiftMask,       		XK_Print,  spawn,          SHCMD("~/.config/dwm/util/kb_screenshot_w.sh") },
    { 0,                            XF86XK_MonBrightnessUp,    spawn,      {.v = scrbgtUp } },
    { 0,                            XF86XK_MonBrightnessDown,  spawn,      {.v = scrbgtDown } },
    { 0,                            XF86XK_AudioRaiseVolume,   spawn,      {.v = volumeUp } },
    { 0,                            XF86XK_AudioLowerVolume,   spawn,      {.v = volumeDown } },
    { 0,                            XF86XK_AudioMute,          spawn,      {.v = volumeMute } },
    { 0,                            XF86XK_ScreenSaver,        spawn,      SHCMD("slock") },
    { 0,                            XF86XK_AudioMicMute,       spawn,      SHCMD("~/.config/dwm/util/kb_micMuteLED.sh") },
    { 0,               				XF86XK_Launch1,            spawn,      SHCMD("~/.config/dwm/util/dwm_power_menu.sh") },
    { 0,                            XK_Caps_Lock,              spawn,      SHCMD("~/.config/dwm/util/kb_capsLockToMicMuteLED.sh") },
    { 0,               				XF86XK_Calculator,         spawn,      SHCMD("xcalc") },
    TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

