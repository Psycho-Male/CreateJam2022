spawn_list=[];
spawn_timer=GetTimer(60);
//Arka arkaya		[20]
//İç içe					[10]
//Wave arası		[1040]
switch(room){
    case rm_stage1:
	#region Wave [1]
    ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	#endregion
	#region Wave[2]
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,60]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	#endregion
	#region Wave[3]
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	#endregion
	#region Wave[4]
	ArrayAdd(spawn_list,[Tank,60]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	#endregion
	//Wave[5]
	ArrayAdd(spawn_list,[Tank,40]);
	ArrayAdd(spawn_list,[Tank,40]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	//Wave[6]
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,1040]);
	//wave[7]
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,60]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	//Wave[8]
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	//Wave[9]
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	//Wave[10]
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Tank,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	//Wave[11]
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	//Wave[12]
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,10]);
	ArrayAdd(spawn_list,[Ladybug,60]);
	ArrayAdd(spawn_list,[Fly,10]);
	ArrayAdd(spawn_list,[Fly,10]);
	ArrayAdd(spawn_list,[Fly,10]);
	ArrayAdd(spawn_list,[Fly,10]);
	ArrayAdd(spawn_list,[Fly,20]);
	ArrayAdd(spawn_list,["Next Wave Incoming",1040]);
	//Wave[13]
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,10]);
	ArrayAdd(spawn_list,[Tank,1040]);
    Trace("Length: "+str(array_length(spawn_list)));
    break;
}
