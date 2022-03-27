scribble("[spr_heart][c_red] "+str(plHp)+"[/c]").align(fa_left,fa_middle).draw(32,24);
scribble("[spr_cash][c_yellow] "+str(plGold)+"[/c]").align(fa_left,fa_middle).draw(32,24+12);


scribble("Press left mouse button to plant on digged tiles.").align(fa_right,fa_middle).draw(displayWidth,48);
var _text=ChrName(KEY.inputs[inp.action1])+" to dig.\n";
_text+=ChrName(KEY.inputs[inp.action2])+" to interact.\n";
_text+=ChrName(KEY.inputs[inp.action3])+" to sell.";

scribble(_text).align(fa_right,fa_top).draw(displayWidth,60);
