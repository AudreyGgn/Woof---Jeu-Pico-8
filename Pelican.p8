pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
-- mandatory

function _init()
	create_player() 
	init_msg()
end

function _update()
	if not messages[1] then
		player_movement()
	end
	woof1()
	woof2()
--	woof3()
	down()
	up()
	obstacle()
	didacticiel()
	update_msg()
	var()
end

function _draw()
	cls()
	draw_map()
	draw_player()
	draw_msg()
	draw_var()
end
-->8
-- map

function draw_map()
	map (0,0,0,0,128,64)
end

function check_flag(flag,x,y)
	local sprite=mget(x,y)
	return fget(sprite,flag)
end

-->8

-- player + woof

function create_player()
	p={x=6,y=2,sprite=16}
end

function player_movement()
	newx=p.x
	newy=p.y
		if (btnp(➡️)) newx+=1
		if (btnp(⬅️)) newx-=1
	--	if (btnp(⬇️)) newy+=1
	--	if (btnp(⬆️)) newy-=1

	if not check_flag(0,newx,newy) then
		p.x=newx
		p.y=newy
	end
end

function draw_player()
	spr(p.sprite,p.x*8,p.y*8)
end

-- commandes sons

function woof1()
	if (btn(⬆️)) sfx(0) end
	
function woof2()	
 if (btn(⬇️)) sfx(1) end

--function woof3()
-- if (btn(➡️)) sfx(2) end

-- !regler les commandes
-- haut bas : sons, dg bouger
-- x passer les msgs
-->8
-- actions

-- fonction action descendre

function down()
	if (btn(4)) then --a enlever
	repeat 
		newy+=1
		newx=p.x
	until check_flag(0,newx,newy+1)
		p.x=newx
		p.y=newy
	end
end

-- fonction action monter

function up()
if (btn(4)) then -- a enlever
	repeat 
		newy-=1
		newx=p.x
	until check_flag(0,newx,newy+1)
		p.x=newx
		p.y=newy
	end
end
-->8
-- flags

function obstacle()
	if check_flag(1,newx,newy) then
	create_msg("aveugle",
	"on s'arrete, que dois-je \nfaire?")
	end
	-- + modif sprite (medor assis)
end

function didacticiel()
	if check_flag(2,newx,newy) then
	create_msg("dida",
	"consignes")
	end
end 
	
-->8
-- messages

function init_msg()
	messages ={}
end

function create_msg(name,...)
	msg_title=name
	messages={...}
end

function update_msg()
	if (btn(❎)) then
		deli(messages,1)
	end
end

function draw_msg()
	if messages[1] then
		local y=100
		if p.y%16>9 then
		y=10
		end
		rectfill(3,y+8,124,y+24,4)
		rect(3,y+8,124,y+24,2)
		print(messages[1],6,y+11,15)
	end
end


-->8
-- fonctions signal

a="a"
b="b"
c="c"
d="d"

function var()
 if (btnp(⬅️)) then a=1 end
 if (btnp(⬆️)) then b=2 end
 if (btnp(⬇️)) then c=3 end
 if (btnp(➡️)) then d=4 end
 notes=a..b..c..d
end

function draw_var()
 print(notes,10,2,7)
end
-- coordonnes du print hors
-- du cadre





	

__gfx__
00000000444444443333333388000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000444444443333333300800880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700333333333333333300088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000333333333333333300088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000333333333333333300800800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700333333333333333300800080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333333333333308000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888888883333333380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900000000000099990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09000090000000000999999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90000009000000009919919900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90900909000000009999999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90000009000000009599995900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90000009000000009955559900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09000090000000000998899000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900000000000099990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001000500000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020402020203020212020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000003050080500e05013050170501c050260502605022050200501d0501a05016050110500d05009050060500405003050010500005000000000000000000000000000000000000000000000000000
0001000000000060500c05011050180501b0501d0501e0501f050200502005020050200501f0501d0501b05018050140500d05007050010500000000000000000000000000000000000000000000000000000000
