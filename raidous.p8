pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
--main game

function _init()
	timer=0
	reactoranimtimer=0
	playables={}
	p={x=60,
				y=100,
				speed=2,
				speedred=2,
				lifespeedred=2,
				hitboxx1=1,
				hitboxx2=6,
				hitboxy1=1,
				hitboxy2=6,
				life=10,
				isshooting=false,
				skin=1,
				weaponlevel=0,
				weapontype=1,
				shootiming=0,
				launcherindex=1,
				shootanim={48,48,49,49,50,50,51,51,52,52},
				animtimer=1,
				invincframes=0,
				frstwpnskin=12,
				scndwpnskin=28}
	add(playables,p)
	alien={hitboxx1=0,
								hitboxx2=7,
								hitboxy1=0,
								hitboxy2=7,
								life=2,
								skin=4,
								shoottimer=0,
								shoottiming=60,
								launcherindex=2,
								numbull=1,
								bullspeed=1.5,
								bullraj=1,
								bullskin=11,
								bulldmg=1,
								ishoming=false,
								bullhitboxx1=2,
								bullhitboxy1=2,
								bullhitboxx2=5,
								bullhitboxy2=5,
								scoredrop=100,
								colo=14,
								midcolo=8,
								endcolo=2,
								movespeed=0.5}	
	superalien={hitboxx1=0,
													hitboxx2=7,
													hitboxy1=0,
													hitboxy2=7,
													life=5,
													skin=5,
													shoottimer=0,
													shoottiming=60,
													launcherindex=3,
													numbull=3,
													bullspeed=1.5,
													bulltraj=1,
													bullskin=11,
													bulldmg=1,
													ishoming=false,
													bullhitboxx1=2,
													bullhitboxy1=2,
													bullhitboxx2=5,
													bullhitboxy2=5,
													scoredrop=250,
													colo=14,
													midcolo=8,
													endcolo=2,
													movespeed=0.3}
	ultraalien={hitboxx1=0,
													hitboxx2=7,
													hitboxy1=0,
													hitboxy2=7,
													life=10,
													skin=6,
													shoottimer=0,
													shoottiming=30,
													launcherindex=4,
													numbull=5,
													bullspeed=1.5,
													bulltraj=1,
													bullskin=11,
													bulldmg=1.5,
													ishoming=false,
													bullhitboxx1=2,
													bullhitboxy1=2,
													bullhitboxx2=5,
													bullhitboxy2=5,
													scoredrop=500,
													colo=14,
													midcolo=8,
													endcolo=2,
													movespeed=0.05}
	vshooter={hitboxx1=0,
											hitboxx2=7,
											hitboxy1=0,
											hitboxy2=7,
											life=10,
											skin=7,
											shoottiming=30,
											launcherindex=5,
											numbull=2,
											bullspeed=2,
											bulltraj=1,
											bullskin=58,
											bulldmg=3,
											ishoming=false,
											bullhitboxx1=2,
											bullhitboxy1=2,
											bullhitboxx2=5,
											bullhitboxy2=5,
											scoredrop=500,
											colo=11,
											midcolo=3,
											endcolo=3,
											movespeed=0.2}
	bonuship={hitboxx1=0,
											hitboxx2=15,
											hitboxy1=0,
											hitboxy2=15,
											life=7,
											skin=72,
											shoottimer=0,
											shoottiming=120,
											launcherindex=6,
											numbull=1,
											bullspeed=1.5,
											bulltraj=1,
											bullskin=51,
											bulldmg=1,
											ishoming=false,
											bullhitboxx1=2,
											bullhitboxy1=2,
											bullhitboxx2=5,
											bullhitboxy2=5,
											scoredrop=100,
											colo=7,
											midcolo=12,
											endcolo=1,
											movespeed=0.2}
	spiralshooter={hitboxx1=0,
																hitboxx2=7,
																hitboxy1=0,
																hitboxy2=7,
																life=30,
																skin=9,
																shoottiming=15,
																launcherindex=7,
																numbull=2,
																bullspeed=0.75,
																bulltraj=1,
																bullskin=11,
																bulldmg=1,
																ishoming=false,
																bullhitboxx1=2,
																bullhitboxy1=2,
																bullhitboxx2=5,
																bullhitboxy2=5,
																scoredrop=200,
																colo=14,
																midcolo=8,
																endcolo=2,
																movespeed=2}
	superspiralshooter={hitboxx1=0,
																					hitboxx2=7,
																					hitboxy1=0,
																					hitboxy2=7,
																					life=60,
																					skin=10,
																					shoottiming=12,
																					launcherindex=8,
																					numbull=4,
																					bullspeed=0.75,
																					bulltraj=1,
																					bullskin=11,
																					bulldmg=1,
																					ishoming=false,
																					bullhitboxx1=2,
																					bullhitboxy1=2,
																					bullhitboxx2=5,
																					bullhitboxy2=5,
																					scoredrop=400,
																					colo=14,
																					midcolo=8,
																					endcolo=2}																																																																																																																																																																																																																																																																																																																																						
	ultraspiralshooter={hitboxx1=0,
																					hitboxx2=7,
																					hitboxy1=0,
																					hitboxy2=7,
											 									life=90,
																					skin=26,
																					shoottiming=10,
																					launcherindex=9,
													 							numbull=8,
												 								bullspeed=0.75,
																					bulltraj=1,
																					bullskin=11,
																					bulldmg=1,
																					ishoming=false,
																					bullhitboxx1=2,
																					bullhitboxy1=2,
																					bullhitboxx2=5,
																					bullhitboxy2=5,
																					scoredrop=600,
																					colo=14,
																					midcolo=8,
																					endcolo=2,
																					movespeed=2}
	randomshooter={hitboxx1=0,
																hitboxx2=7,
																hitboxy1=0,
																hitboxy2=7,
																life=30,
																skin=24,
																shoottiming=8,
																launcherindex=10,
																numbull=3,
																bullspeed=0.75,
																bulltraj=1,
																bullskin=58,
																bulldmg=1,
																ishoming=false,
																bullhitboxx1=2,
																bullhitboxy1=2,
																bullhitboxx2=5,
																bullhitboxy2=5,
																scoredrop=500,
																colo=8,
																midcolo=11,
																endcolo=3}
	superrandomshooter={hitboxx1=0,
																					hitboxx2=7,
																					hitboxy1=0,
																					hitboxy2=7,
																					life=30,
																					skin=24,
																					shoottiming=8,
																					launcherindex=11,
																					numbull=6,
																					bullspeed=0.75,
																					bulltraj=1,
																					bullskin=58,
																					bulldmg=1,
																					ishoming=false,
																					bullhitboxx1=2,
																					bullhitboxy1=2,
																					bullhitboxx2=5,
																					bullhitboxy2=5,
																					scoredrop=500,
																					colo=8,
																					midcolo=11,
																					endcolo=3}																																																																																																																																																																																																																																																																																																																																																																															
	ultrarandomshooter={hitboxx1=0,
																					hitboxx2=7,
																					hitboxy1=0,
																					hitboxy2=7,
																					life=40,
																					skin=40,
																					shoottiming=8,
																					launcherindex=12,
																					numbull=9,
																					bullspeed=0.75,
																					bulltraj=1,
																					bullskin=43,
																					bulldmg=1,
																					ishoming=false,
																					bullhitboxx1=2,
																					bullhitboxy1=2,
																					bullhitboxx2=5,
																					bullhitboxy2=5,
																					scoredrop=500,
																					colo=14,
																					midcolo=8,
																					endcolo=2}
	alienboss={hitboxx1=0,
												hitboxx2=15,
												hitboxy1=0,
												hitboxy2=15,
												life=40,
												skin=22,
												shoottimer=0,
												shoottiming=60,
												launcherindex=13,
												numbull=1,
												bullspeed=2,
												bulltraj=1,
												bullskin=11,
												bulldmg=1,
												ishoming=false,
												bullhitboxx1=2,
												bullhitboxy1=2,
												bullhitboxx2=5,
												bullhitboxy2=5,
												scoredrop=1000,
												colo=14,
												midcolo=8,
												endcolo=2}
	detonater={hitboxx1=0,
												hitboxx2=7,
												hitboxy1=0,
												hitboxy2=7,
												life=5,
												skin=25,
												shoottimer=0,
												shoottiming=60,
												launcherindex=14,
												numbull=1,
												bullspeed=4,
												bulltraj=1,
												bullskin=48,
												bulldmg=1,
												ishoming=false,
												bullhitboxx1=2,
												bullhitboxy1=2,
												bullhitboxx2=5,
												bullhitboxy2=5,
												scoredrop=100,
												colo=14,
												midcolo=8,
												endcolo=2,
												movespeed=0.1}
	detonaterboss={hitboxx1=0,
																hitboxx2=15,
																hitboxy1=0,
																hitboxy2=15,
																life=40,
																skin=68,
																shoottimer=0,
																shoottiming=20,
																launcherindex=15,
																numbull=1,
																bullspeed=4,
																bulltraj=1,
																bullskin=48,
																bulldmg=1,
																ishoming=false,
																bullhitboxx1=2,
																bullhitboxy1=2,
																bullhitboxx2=5,
																bullhitboxy2=5,
																scoredrop=1000,
																colo=14,
																midcolo=8,
																endcolo=2}
	lifedropper={hitboxx1=0,
														hitboxx2=7,
														hitboxy1=0,
														hitboxy2=7,
														life=20,
														skin=41,
														shoottimer=0,
														shoottiming=0,
														launcherindex=16,
														numbull=0,
														bullspeed=0,
														bulltraj=0,
														bullskin=0,
														bulldmg=0,
														ishoming=false,
														bullhitboxx1=0,
														bullhitboxy1=0,
														bullhitboxx2=0,
														bullhitboxy2=0,
														scoredrop=0,
														colo=7,
														midcolo=6,
														endcolo=5}																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																								
	kamikaze={hitboxx1=0,
											hitboxx2=7,
											hitboxy1=0,
											hitboxy2=7,
											life=1,
											skin=42,
											shoottimer=0,
											shoottiming=0,
											launcherindex=17,
											numbull=0,
											bullspeed=0,
											bulltraj=0,
											bullskin=0,
											bulldmg=0,
											ishoming=false,
											bullhitboxx1=0,
											bullhitboxy1=0,
											bullhitboxx2=0,
											bullhitboxy2=0,
											scoredrop=50,
											colo=10,
											midcolo=9,
											endcolo=4}														
	spiralboss={hitboxx1=0,
													hitboxx2=15,
													hitboxy1=0,
													hitboxy2=15,
													life=40,
													skin=70,
													shoottimer=0,
													shoottiming=5,
													launcherindex=18,
													numbull=8,
													bullspeed=0.5,
													bulltraj=0,
													bullskin=11,
													bulldmg=1,
													ishoming=false,
													bullhitboxx1=2,
													bullhitboxy1=2,
													bullhitboxx2=5,
													bullhitboxy2=5,
													scoredrop=1000,
													colo=14,
													midcolo=8,
													endcolo=2}											
	hitparts={}			
	circr=1			
 bullets={}
 allenemies={}
 stars={}
 planets={}
 bigplanets={}
 t=0
 for i=1,25 do
 	createfrontstars()
 end
 for i=1,20 do
 	createforwardstars()
 end
 for i=1,15 do
 	createbackstars()
 end
 createplanet()							
 createbigplanet()
 score={value=0,colo=7,colovalue=0}
 music(0)
 wavetiming=0
 bonus={}
 scoregains={}
 shakex=0
 shakey=0
end

function _update60()
	t+=1
	if wavetiming!=5 then
		if shakex>1 and shakey>1 then
			shakey-=1
			shakex-=1	
		end
		if shakex<=1 and shakey<=1 then
			shakex=0
			shakey=0
		end
		for p in all(playables) do
			moveplayer(p)
		end
		updatebullets()
		updateennemies()
		updatestars()
		updateplanets()
		updatebigplanets()
		updatebonus()
	end	
end

function _draw()
	cls()
	map()
	camera(rnd(shakex)-(shakex/2),rnd(shakey)-shakey/2)
	if wavetiming!=5 then
		for p in all(bigplanets) do
			spr(p.skin,p.x,p.y,2,2)
		end
		for p in all(planets) do
			spr(p.skin,p.x,p.y)
		end
		for s in all(stars) do
			pset(s.x,s.y,s.colo)
		end
		for b in all(bonus) do
			if b.consumed==false then
				spr(b.skin,b.x,b.y)
			end
			if b.consumed==true and b.bonustype=="powerup" then
				print("power up ✽ !",b.x-19,b.y,7)
				b.y-=1
				b.txtfxlife-=1
			end
			if b.consumed==true and b.bonustype=="lifeup" then
				print("life up ♥ !",b.x-19,b.y,7)
				b.y-=1
				b.txtfxlife-=1
			end		
			if b.txtfxlife==0 then
				del(bonus,b)
			end	
		end					
		for b in all(bullets) do
			if b.launcherindex!=1 then
				spr(b.skin,b.x,b.y)
			end			
		end
		for b in all(bullets) do
			if b.launcherindex==1 then
				spr(b.skin,b.x,b.y)
			end			
		end	
		for htp in all(hitparts) do
			circfill(htp.x,htp.y,htp.radius,htp.colo)
			htp.x+=htp.speedx
			htp.y+=htp.speedy
			htp.speedx*=0.9
			htp.speedy*=0.9
			htp.radius-=htp.shrinkrate
			if htp.radius<(htp.originalradius/3)*2 then
				htp.colo=htp.midcolo
			end			
			if htp.radius<htp.originalradius/3 then
				htp.colo=htp.endcolo
			end
			if htp.radius<0.1 then
				del(hitparts,htp)
			end
		end	
		for p in all(playables) do
			--if 53+reactoranimtimer==58 then
				--reactoranimtimer=0
			--end
			if p.invincframes<0 or p.invincframes%2!=0 then
				for i=1,5 do
					newhitpart={x=p.x+1,
																	y=p.y+8,
																	speedx=0,
																	speedy=rnd(4)+1,
																	colo=12,
																	midcolo=1,
																	endcolo=1,																	
																	radius=1+rnd(),
																	originalradius=0,
																	shrinkrate=0.4}
					newhitpart.originalradius=newhitpart.radius																								
					add(hitparts,newhitpart)
				end
				if p.life>1 then
					for i=1,5 do
						newhitpart={x=p.x+6,
																		y=p.y+8,
																		speedx=0,
																		speedy=rnd(4)+1,
																		colo=12,
																		midcolo=1,
																		endcolo=1,																	
																		radius=1+rnd(),
																		originalradius=0,
																		shrinkrate=0.4}
						newhitpart.originalradius=newhitpart.radius																								
						add(hitparts,newhitpart)
					end		
				end	
				spr(p.skin,p.x,p.y)		
			end	
			--spr(53+reactoranimtimer,p.x,p.y+8)
			--reactoranimtimer+=1
		end
		for enms in all(allenemies) do
			if enms.launcherindex==13 or enms.launcherindex==15 or enms.launcherindex==18 or enms.launcherindex==6 then
				spr(enms.skin,enms.x,enms.y,2,2)
			else
				spr(enms.skin,enms.x,enms.y)	
			end
			if enms.launcherindex==17 then
				for i=1,5 do
					newhitpart={x=enms.x+3.5,
																	y=enms.y-1,
																	speedx=0,
																	speedy=-rnd(4)+1,
																	colo=10,
																	midcolo=9,
																	endcolo=4,																	
																	radius=1+rnd(),
																	originalradius=0,
																	shrinkrate=0.4}
					newhitpart.originalradius=newhitpart.radius																								
					add(hitparts,newhitpart)
				end			
			end		
		end
		for i=1,p.life-1 do
			spr(31,3,i*8+i+2)
		end			
		for g in all(scoregains) do
			print("+"..g.gain,g.x,g.y,10)
			g.y*=0.9
			if g.y<=3 then
				score.value+=g.gain
				del(scoregains,g)
			end	
		end
		print("score:"..score.value,3,3,7)
	else 
		print("you win ggs !",42,56,7)
	end				
end
-->8
--player movement

function moveplayer(plyr)
	plyr.skin=1
	plyr.invincframes-=1
	if btn(🅾️) then					
			if timer==0 then
				timer=plyr.shootiming
			else
				timer+=1	
			end		
			plyr.isshooting=true
			if plyr.weaponlevel==0 and timer%plyr.shootiming==0 then
				if plyr.weapontype==1 then
					shoot(plyr.x,plyr.y,5,plyr.frstwpnskin,1,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)
					plyr.shootiming=7
				end
				if plyr.weapontype==2 then	
					shoot(plyr.x,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)
					plyr.shootiming=4			
				end									
				sfx(1)
			end
			if plyr.weaponlevel==1 and timer%flr(plyr.shootiming)==0 then
				if plyr.weapontype==1 then
					shoot(plyr.x,plyr.y,5,plyr.frstwpnskin,1,plyr.launcherindex,3,{0.48,0.5,0.52},false,2,2,5,5,false,0,1)
					plyr.shootiming=7
				end
				if plyr.weapontype==2 then	
					shoot(plyr.x+2,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)
					shoot(plyr.x-2,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)				
					plyr.shootiming=5			
				end						
				sfx(1)
			end		
			if plyr.weaponlevel==2 and timer%flr(plyr.shootiming)==0 then
				if plyr.weapontype==1 then
					shoot(plyr.x,plyr.y,5,plyr.frstwpnskin,1,plyr.launcherindex,5,{0.46,0.48,0.5,0.52,0.54},false,2,2,5,5,false,0,1)
					plyr.shootiming=7
				end
				if plyr.weapontype==2 then	
					shoot(plyr.x,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)			
					shoot(plyr.x-4,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)				
					shoot(plyr.x+4,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)									
					plyr.shootiming=5
				end					
				sfx(1)
			end
			if plyr.weaponlevel>=3 and timer%flr(plyr.shootiming)==0 then
				if plyr.weapontype==1 then
					shoot(plyr.x,plyr.y,5,plyr.frstwpnskin,1,plyr.launcherindex,7,{0.44,0.46,0.48,0.5,0.52,0.54,0.56},false,2,2,5,5,false,0,1)
					plyr.shootiming=7
				end
				if plyr.weapontype==2 then	
					shoot(plyr.x-2,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)			
					shoot(plyr.x+2,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)			
					shoot(plyr.x-6,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)				
					shoot(plyr.x+6,plyr.y,5,plyr.scndwpnskin,2.5,plyr.launcherindex,1,{0.5},false,2,2,5,5,false,0,1)														
					plyr.shootiming=5
				end	
				sfx(1)
			end	
		if timer%plyr.shootiming==0 then	
			for i=1,5 do
				newhitpart={x=plyr.x+4,
																y=plyr.y-1,
																speedx=rnd(4)-2,
																speedy=-rnd(4)+1,
																colo=12,
																midcolo=1,
																endcolo=1,																	
																radius=1+rnd(),
																originalradius=0,
																shrinkrate=0.2}
				newhitpart.originalradius=newhitpart.radius																								
				add(hitparts,newhitpart)
			end
		end
			--if plyr.weaponlevel>=4 and timer%flr(plyr.shootiming)==0 then
				--shoot(plyr.x,plyr.y,5,12,1,plyr.launcherindex,8,{0.43,0.45,0.47,0.49,0.51,0.53,0.55,0.57},false,1,1,6,6)
				--shoot(plyr.x,plyr.y,5,28,1,plyr.launcherindex,16,{0.25,0.3125,0.375,0.4375,0.5,0.5625,0.625,0.6875,0.75,0.8125,0.875,0.9375,1,0.0625,0.125,0.1875},false,1,1,6,6)			
				--sfx(1)
			--end
	else
		timer=0								
	end
	if btn(⬅️) then
		plyr.skin=2
		if plyr.life<2 then
			if btn(🅾️) then
				--plyr.x-=plyr.speed/plyr.speedred/plyr.lifespeedred
				plyr.x-=plyr.speed/plyr.lifespeedred	
			else
				plyr.x-=plyr.speed/plyr.lifespeedred	
			end	
		else
			if btn(🅾️) then
				plyr.x-=plyr.speed/plyr.speedred
			else
				plyr.x-=plyr.speed
			end	
		end
	end
	if btn(➡️) then
		plyr.skin=3
		if plyr.life<2 then
			if btn(🅾️) then
				--plyr.x+=plyr.speed/plyr.speedred/plyr.lifespeedred
				plyr.x+=plyr.speed/plyr.lifespeedred	
			else
				plyr.x+=plyr.speed/plyr.lifespeedred	
			end	
		else
			if btn(🅾️) then
				plyr.x+=plyr.speed/plyr.speedred
			else
				plyr.x+=plyr.speed
			end	
		end		
	end
	if btn(⬇️) then
		if plyr.life<2 then
			if btn(🅾️) then
				--plyr.y+=plyr.speed/plyr.speedred/plyr.lifespeedred
				plyr.y+=plyr.speed/plyr.lifespeedred	
			else
				plyr.y+=plyr.speed/plyr.lifespeedred	
			end	
		else
			if btn(🅾️) then
				plyr.y+=plyr.speed/plyr.speedred
			else
				plyr.y+=plyr.speed
			end	
		end	
	end
	if btn(⬆️) then
		if plyr.life<2 then
			if btn(🅾️) then
				--plyr.y-=plyr.speed/plyr.speedred/plyr.lifespeedred
				plyr.y-=plyr.speed/plyr.lifespeedred	
			else
				plyr.y-=plyr.speed/plyr.lifespeedred	
			end	
		else
			if btn(🅾️) then
				plyr.y-=plyr.speed/plyr.speedred
			else
				plyr.y-=plyr.speed
			end	
		end
	end
	if plyr.x<0 then
		plyr.x=0
	end	
 if plyr.x>120 then
		plyr.x=120		
	end
	if plyr.y<0 then
		plyr.y=0
	end
	if plyr.y>120 then
		plyr.y=120
	end
	if btnp(❎) then
		if plyr.weapontype==2 then
			plyr.weapontype=1
		else	
			plyr.weapontype=2
		end			
	end
	--if plyr.isshooting==true then
		--plyr.skin=plyr.shootanim[plyr.animtimer]
		--plyr.animtimer+=1
		--if plyr.animtimer==10 then
			--plyr.animtimer=1
			--plyr.isshooting=false
		--end
	--end
	if plyr.life<5 and plyr.life>0 and (plyr.invincframes<0 or plyr.invincframes%2!=0) then
		for i=1,3 do
			newhitpart={x=plyr.x+4,
															y=plyr.y+3,
															speedx=-rnd(4),
															speedy=-rnd(4)+1,
															colo=10,
															midcolo=9,
															endcolo=5,																	
															radius=1+rnd(),
															originalradius=0,
															shrinkrate=0.25}
			newhitpart.originalradius=newhitpart.radius																								
			add(hitparts,newhitpart)
		end		
	end
	if plyr.life<2 and plyr.life>0 and plyr.invincframes<0 and plyr.invincframes%2!=0 then	
		for i=1,3 do
			newhitpart={x=plyr.x+4,
															y=plyr.y+5,
															speedx=rnd(4),
															speedy=rnd(4)+1,
															colo=10,
															midcolo=9,
															endcolo=5,																	
															radius=1+rnd(),
															originalradius=0,
															shrinkrate=0.25}
			newhitpart.originalradius=newhitpart.radius																								
			add(hitparts,newhitpart)
		end		
	end
	if plyr.life<=0 then
		sfx(5)
		shake(100)
		for i=1,20 do
			newhitpart={x=plyr.x+3,
															y=plyr.y+3,
															speedx=rnd(8)-4,
															speedy=rnd(8)-4,
															colo=10,
															midcolo=9,
															endcolo=5,																	
															radius=6+rnd(6),
															originalradius=0,
															shrinkrate=0.4}
			newhitpart.originalradius=newhitpart.radius																								
			add(hitparts,newhitpart)
		end																
		del(playables,plyr)					
	end
	for b in all(bullets) do
		if collision(b,plyr) and b.launcher!=1 and plyr.invincframes<=0 and b.launcher!=0 then
			plyr.invincframes=40
			shake(10)
			del(bullets,b)			
			if plyr.life-b.dmg>0 then
				for i=1,20 do
					newhitpart={x=plyr.x+3,
																	y=plyr.y+3,
																	speedx=rnd(6)-3,
																	speedy=rnd(6)-3,
																	colo=10,
																	midcolo=9,
																	endcolo=5,																	
																	radius=4+rnd(4),
																	originalradius=0,
																	shrinkrate=0.5}
					newhitpart.originalradius=newhitpart.radius																								
					add(hitparts,newhitpart)
				end
				sfx(3)													
			end
			plyr.life-=b.dmg							
		end
	end
	for enms in all(allenemies) do
		if collision(enms,plyr) and plyr.invincframes<=0 then
			plyr.invincframes=40
			shake(10)
			enms.life-=1
			if plyr.life-1>0 then
				for i=1,20 do
					newhitpart={x=plyr.x+3,
																	y=plyr.y+3,
																	speedx=rnd(6)-3,
																	speedy=rnd(6)-3,
																	colo=10,
																	midcolo=9,
																	endcolo=5,																	
																	radius=4+rnd(4),
																	originalradius=0,
																	shrinkrate=0.5}
					newhitpart.originalradius=newhitpart.radius																								
					add(hitparts,newhitpart)
				end
				sfx(3)													
			end
			plyr.life-=1							
		end
	end			
end
-->8
--shooting

function shoot(x,y,speed,skin,dmg,launcher,numbull,orientationofbulls,ishoming,hitboxx1,hitboxy1,hitboxx2,hitboxy2,isbomb,bombtime,life)
	for i=1,numbull do
		new_bullet={x=x,
														y=y,
														speed=speed,
														aim=orientationofbulls[i],
														skin=skin,
														skinanim=0,
														animtimer=0,
														dmg=dmg,
														launcher=launcher,
														homing=ishoming,
														hitboxx1=hitboxx1,
														hitboxy1=hitboxy1,
														hitboxx2=hitboxx2,
														hitboxy2=hitboxy2,
														bombtype=isbomb,
														bombtime=bombtime,
														bombtimer=0,
														bombed=false,														
														life=life}
		if launcher==18 or launcher==6 then
			new_bullet.x+=5
			new_bullet.y+=2
		end
		if new_bullet.skin==11 then
			new_bullet.skinanim={11,11,11,27,27,27,43,43,43}
		end
		if new_bullet.skin==51 then
			new_bullet.skinanim={51,51,51,52,52,52,53,53,53,54,54,54}
		end
		if new_bullet.skin==58 then
			new_bullet.skinanim={58,58,58,57,57,57,56,56,56,55,55,55}
		end
		if new_bullet.skin==48 then
			new_bullet.skinanim={48,48,48,49,49,49}
		end																																																																																										
		add(bullets,new_bullet)											
	end
end

function updatebullets()
	for b in all(bullets) do
		if b.skinanim!=0 then
			b.animtimer+=1
			b.skin=b.skinanim[b.animtimer]
			if b.animtimer==#b.skinanim then
				b.animtimer=0
			end		
		end
		b.x+=sin(b.aim)*b.speed
		b.y+=cos(b.aim)*b.speed
		if b.launcher==18 then
			b.speed*=1.05
		end	
		if b.y>=128 or b.y<=-8 or b.x<=-8 or b.x>=128 or b.life<0 then
			del(bullets,b)
		end
		if (b.launcher==14 or b.launcher==15) and b.bombtype==true then
			b.speed*=0.95
		end	
		if b.bombtype==true then
			b.bombtimer+=1
			if b.bombtimer>=b.bombtime then
				b.bombed=true
			end
		end
		if b.bombed==true then
			if b.launcher==14 or b.launcher==15 then
				shoot(b.x,b.y,0.5,11,1,b.launcher,8,{0.125,0.25,0.375,0.5,0.625,0.75,0.875,0.0},false,2,2,5,5,false,0,1)
				for i=1,10 do
					newhitpart={x=b.x+3,
																	y=b.y+3,
																	speedx=rnd(6)-3,
																	speedy=rnd(6)-3,
																	colo=15,
																	midcolo=10,
																	endcolo=9,																	
																	radius=4+rnd(4),
																	originalradius=0,
																	shrinkrate=0.5}
					newhitpart.originalradius=newhitpart.radius																								
					add(hitparts,newhitpart)
				end
			end	
			del(bullets,b)
		end
	end
end
-->8
--collision function

function collision(col1,col2)
	return not (col1.x+col1.hitboxx1>col2.x+col2.hitboxx2
	or col1.y+col1.hitboxy1>col2.y+col2.hitboxy2
	or col1.x+col1.hitboxx2<col2.x+col2.hitboxx1
	or col1.y+col1.hitboxy2<col2.y+col2.hitboxy1)			
end
-->8
--ennemies movement
function spawnenemies(enemies,startplaces,placements)
	for i=1,#enemies do
		new_enemi={finalx=placements[i*2-1],
 												finaly=placements[i*2],
 												startx=startplaces[i*2-1],
 												starty=startplaces[i*2], 																									
													x=startplaces[i*2-1],
 												y=startplaces[i*2],
													hitboxx1=enemies[i].hitboxx1,
													hitboxx2=enemies[i].hitboxx2,
													hitboxy1=enemies[i].hitboxy1,
													hitboxy2=enemies[i].hitboxy2, 													
 												life=enemies[i].life,
 												flipped=true,
 												skin=enemies[i].skin,
 												shoottimer=flr(rnd(20)),
 												shoottiming=enemies[i].shoottiming,
 												launcherindex=enemies[i].launcherindex,
 												numbull=enemies[i].numbull,
													bullspeed=enemies[i].bullspeed,
													bulltraj=enemies[i].bulltraj,
													bullskin=enemies[i].bullskin,
													bulldmg=enemies[i].bulldmg,
													ishoming=enemies[i].ishoming,
													bullhitboxx1=enemies[i].bullhitboxx1,
													bullhitboxy1=enemies[i].bullhitboxy1,
													bullhitboxx2=enemies[i].bullhitboxx2,
													bullhitboxy2=enemies[i].bullhitboxy2,
													scoredrop=enemies[i].scoredrop,
													timer=0,
													turning=false,
													colo=enemies[i].colo,
													midcolo=enemies[i].midcolo,
													endcolo=enemies[i].endcolo,
													movespeed=enemies[i].movespeed,
													moveaim=0,
													nbshoots=0} 	
 	if launcherindex==15 then
 		shoottimer=0
		end
		add(allenemies,new_enemi)
		for enms in all(allenemies) do
			if enms.launcherindex==17 and enms.movespeed==nil then
 			add(new_enemi,lastmoveaim)
 			add(new_enemi,movespeed) 					
				enms.movespeed=0.5
			end
			if enms.launcherindex==18 then
 			add(new_enemi,reverse)
 			enms.reverse=true					
			end			
		end
 end							
end

function updateennemies()
	for enms in all(allenemies) do
		if enms.y>0 then
			enms.shoottimer+=1
		end	
		if (enms.shoottimer%enms.shoottiming==0 and enms.y>0 and (enms.x>0 or enms.x<120) and enms.y<120 and enms.launcherindex!=16 and enms.launcherindex!=17 and enms.bulltraj!=0 and enms.shootiming!=0) or ((enms.turning==true and enms.shoottimer%enms.shoottiming==0 and enms.y<120) and enms.launcherindex!=16 and enms.launcherindex!=17 and enms.bulltraj!=0) or (enms.nbshoots==0 and enms.shoottiming!=0 and enms.launcherindex!=10 and enms.launcherindex!=11 and enms.launcherindex!=12 and enms.launcherindex!=15) then
			enms.nbshoots+=1
			if enms.launcherindex==18 then
				if enms.reverse==false then
					enms.bulltraj={1+time()/10,0.75+time()/10,0.5+time()/10,0.25+time()/10,0.125+time()/10,0.875+time()/10,0.625+time()/10,0.375+time()/10}
				end
				if enms.reverse==true then
					enms.bulltraj={1-time()/10,0.75-time()/10,0.5-time()/10,0.25-time()/10,0.125-time()/10,0.875-time()/10,0.625-time()/10,0.375-time()/10}
				end
			end																	
			if enms.launcherindex==15 then
				enms.bulltraj={rnd(0.25)+0.875}
			end					
			if enms.launcherindex==14 then
				enms.bulltraj={atan2(p.y-enms.y,p.x-enms.x)}
			end				
			if enms.launcherindex==13 then
				if enms.life<=20 then
					enms.numbull=5
					enms.bulltraj={atan2(p.y-enms.y-7,p.x-enms.x-7)+0.1,atan2(p.y-enms.y-7,p.x-enms.x-7)+0.05,atan2(p.y-enms.y-7,p.x-enms.x-7),atan2(p.y-enms.y-7,p.x-enms.x-7)-0.05,atan2(p.y-enms.y-7,p.x-enms.x-7)-0.1}
				elseif enms.life<=35 then
					enms.numbull=3
					enms.bulltraj={atan2(p.y-enms.y-7,p.x-enms.x-7)+0.05,atan2(p.y-enms.y-7,p.x-enms.x-7),atan2(p.y-enms.y-7,p.x-enms.x-7)-0.05}
				else	
					enms.bulltraj={atan2(p.y-enms.y-7,p.x-enms.x-7)}					
				end	
			end				
			if enms.launcherindex==12 then
				enms.bulltraj={rnd(),rnd(),rnd(),rnd(),rnd(),rnd(),rnd(),rnd(),rnd()}
			end		
			if enms.launcherindex==11 then
				enms.bulltraj={rnd(),rnd(),rnd(),rnd(),rnd(),rnd()}
			end
			if enms.launcherindex==10 then
				enms.bulltraj={rnd(),rnd(),rnd()}
			end																																					
			if enms.launcherindex==9 then
				enms.bulltraj={1+time()/4,0.75+time()/4,0.5+time()/4,0.25+time()/4,0.125+time()/4,0.875+time()/4,0.625+time()/4,0.375+time()/4}
			end															
			if enms.launcherindex==8 then
				enms.bulltraj={1+time()/4,0.75+time()/4,0.5+time()/4,0.25+time()/4}
			end													
			if enms.launcherindex==7 then
				enms.bulltraj={1+time()/4,0.5+time()/4}
			end									
			if enms.launcherindex==5 then
				enms.bulltraj={atan2(p.y-enms.y,p.x-enms.x)+0.05,atan2(p.y-enms.y,p.x-enms.x)-0.05}
			end							
			if enms.launcherindex==4 then
				enms.bulltraj={atan2(p.y-enms.y,p.x-enms.x)+0.1,atan2(p.y-enms.y,p.x-enms.x)+0.05,atan2(p.y-enms.y,p.x-enms.x),atan2(p.y-enms.y,p.x-enms.x)-0.05,atan2(p.y-enms.y,p.x-enms.x)-0.1}
			end				
			if enms.launcherindex==3 then
				enms.bulltraj={atan2(p.y-enms.y,p.x-enms.x)+0.05,atan2(p.y-enms.y,p.x-enms.x),atan2(p.y-enms.y,p.x-enms.x)-0.05}
			end
			if enms.launcherindex==2 or enms.launcherindex==6 then
				enms.bulltraj={atan2(p.y-enms.y,p.x-enms.x)}
			end
			if enms.launcherindex==13 then
				shoot(enms.x+5,enms.y+8,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,false,0,1)
				enms.bullspeed=1
				shoot(enms.x+5,enms.y+8,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,false,0,1)
				enms.bullspeed=1.5				
				shoot(enms.x+5,enms.y+8,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,false,0,1)
				enms.bullspeed=2
			elseif enms.launcherindex==18 then
				if enms.y>=30 then
					shoot(enms.x,enms.y+3,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,false,0,1)
				end	
			elseif enms.launcherindex==14 then
				shoot(enms.x,enms.y,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,true,30,1)
			elseif enms.launcherindex==15 then
				if enms.shoottimer<300 then
					shoot(enms.x+5,enms.y+5,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,true,30,1)				
				end	
				if enms.shoottimer>=300 and enms.shoottimer<600 then
					enms.bullspeed=1
					enms.numbull=5
					enms.bulltraj={atan2(p.y-enms.y-7,p.x-enms.x-7)+0.1,atan2(p.y-enms.y-7,p.x-enms.x-7)+0.05,atan2(p.y-enms.y-7,p.x-enms.x-7),atan2(p.y-enms.y-7,p.x-enms.x-7)-0.05,atan2(p.y-enms.y-7,p.x-enms.x-7)-0.1}
					enms.bullskin=11
					shoot(enms.x+5,enms.y+5,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,false,0,1)						
				end
				if enms.shoottimer>=600 then
					enms.bullspeed=4
					enms.numbull=1
					enms.bulltraj={rnd(0.25)+0.875}
					enms.bullskin=48
					shoot(enms.x+5,enms.y+5,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,true,30,1)						
				end
				if enms.shoottimer>=900 then
					enms.shoottimer=0
				end				
			elseif enms.launcherindex==7 or enms.launcherindex==9 then		
				shoot(enms.x,enms.y,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,false,0,1)
			else
				shoot(enms.x,enms.y+3,enms.bullspeed,enms.bullskin,enms.bulldmg,enms.launcherindex,enms.numbull,enms.bulltraj,enms.ishoming,enms.bullhitboxx1,enms.bullhitboxy1,enms.bullhitboxx2,enms.bullhitboxy2,false,0,1)					
			end	
			sfx(4)
		end
		if enms.launcherindex==2 then
		 enms.moveaim=atan2(enms.finaly-enms.starty,enms.finalx-enms.startx)
			enms.y+=cos(enms.moveaim)*enms.movespeed
			enms.x+=sin(enms.moveaim)*enms.movespeed
			--if enms.turning==true then
				--enms.x+=sin(enms.timer)
				--enms.timer+=0.01
			--end
			--if enms.y>20 then	
				--enms.movespeed*=1.05
			--end
			--if enms.movespeed>=1 then
				--enms.movespeed=0.2
			--end	
		end
		if enms.launcherindex==3 then
		 enms.moveaim=atan2(enms.finaly-enms.starty,enms.finalx-enms.startx)
			enms.y+=cos(enms.moveaim)*enms.movespeed
			enms.x+=sin(enms.moveaim)*enms.movespeed
			--enms.movespeed*=1.02
		end
		if enms.launcherindex==4 then
			enms.turning=true
			if enms.turning==true then
				enms.x+=sin(enms.timer)
				enms.timer+=0.01
			end
			enms.y+=enms.movespeed
			if enms.y>20 then
				enms.movespeed*=1.05
			end
		end
		if enms.launcherindex==5 then			
			if enms.y<20 and enms.turning==false then
				enms.y+=enms.movespeed
			elseif enms.y>=20 and enms.turning==false then
			 enms.turning=true  
			end
			if enms.turning==true then
				enms.x+=sin(enms.timer)/2
				enms.y+=cos(enms.timer)
				enms.timer+=0.01
			end					
		end			
		if enms.y>180 then
			del(allenemies,enms)
		end
		if enms.launcherindex==6 then
			enms.y+=enms.movespeed
		end	
		if enms.launcherindex==7 then
		 enms.moveaim=atan2(enms.finaly-enms.starty,enms.finalx-enms.startx)
			if enms.startx<enms.finalx then
				if enms.x<enms.finalx then
					enms.x+=sin(enms.moveaim)*enms.movespeed		
				end	
			end
			if enms.startx>enms.finalx then
				if enms.x>enms.finalx then
					enms.x+=sin(enms.moveaim)*enms.movespeed		
				end					
			end	
			if enms.starty<enms.finaly then
				if enms.y<enms.finaly then
					enms.y+=cos(enms.moveaim)*enms.movespeed		
				end					
			end	
			if enms.starty>enms.finaly then
				if enms.y>enms.finaly then
					enms.y+=cos(enms.moveaim)*enms.movespeed		
				end					
			end								
		end
		if enms.launcherindex==8 then
			enms.y+=0.1
		end
		if enms.launcherindex==9 then
			enms.moveaim=atan2(enms.finaly-enms.starty,enms.finalx-enms.startx)
			if enms.startx<enms.finalx then
				if enms.x<enms.finalx then
					enms.x+=sin(enms.moveaim)*enms.movespeed		
				end	
			end
			if enms.startx>enms.finalx then
				if enms.x>enms.finalx then
					enms.x+=sin(enms.moveaim)*enms.movespeed		
				end					
			end	
			if enms.starty<enms.finaly then
				if enms.y<enms.finaly then
					enms.y+=cos(enms.moveaim)*enms.movespeed		
				end					
			end	
			if enms.starty>enms.finaly then
				if enms.y>enms.finaly then
					enms.y+=cos(enms.moveaim)*enms.movespeed		
				end					
			end	
		end
		if enms.launcherindex==10 then
			enms.y+=0.1
		end
		if enms.launcherindex==11 then
			enms.y+=0.1
		end																												
		if enms.launcherindex==12 then
			enms.y+=0.1
		end
		if enms.launcherindex==13 then
			if enms.y>=7 then
				enms.x+=cos(enms.timer)*2
				enms.timer+=0.01				
			else
				enms.y+=0.1
			end					
		end
		if enms.launcherindex==14 then
			enms.y+=enms.movespeed			
		end
		if enms.launcherindex==15 then
			if enms.y>=7 then
				enms.x+=cos(enms.timer/100)*2
				enms.timer+=1				
			else
				enms.y+=0.1
			end						
		end
		if enms.launcherindex==16 then
			if enms.y>=7 and enms.timer<360 then
				enms.x+=cos(enms.timer/100)/2
				enms.timer+=1				
			elseif enms.y<7 then 
				enms.y+=0.1
			elseif enms.timer>=360 then
				enms.y+=1
			end											
		end
		if enms.launcherindex==17 then
			if enms.y<20 then
				enms.lastmoveaim=atan2(p.y-enms.y,p.x-enms.x)
			end
			if enms.y>=0 then	
				enms.movespeed*=1.03
			end	
			enms.x+=sin(enms.lastmoveaim)*enms.movespeed
			enms.y+=cos(enms.lastmoveaim)*enms.movespeed		
		end
		--if enms.launcherindex==18 then
			--if enms.y<30 then
				--enms.y+=1
			--end
			--if enms.y>=30 and enms.bulltraj==0 then
				--enms.bulltraj={0,0.125,0.25,0.375,0.5,0.625,0.75,0.875}
			--end
			--if t%720==0 then
				--enms.reverse=false
			--elseif t%360==0 then 
				--enms.reverse=true	
			--end
		--end																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																						
		if enms.y>180 then
			del(allenemies,enms)
		end					
		if enms.life<=0 then
			del(bullets,b)
			gainscore(enms.scoredrop)
			if enms.launcherindex==13 or enms.launcherindex==15 or enms.launcherindex==18 or enms.launcher==6 then
				for i=1,20 do
					newhitpart={x=enms.x+8,
																	y=enms.y+8,
																	speedx=rnd(6)-3,
																	speedy=rnd(6)-3,
																	colo=enms.colo,
																	midcolo=enms.midcolo,
																	endcolo=enms.endcolo,																	
																	radius=5+rnd(5),
																	originalradius=0,
																	shrinkrate=0.5}
					newhitpart.originalradius=newhitpart.radius																								
					add(hitparts,newhitpart)												
				end
				sfx(9)
			else
				for i=1,20 do
					newhitpart={x=enms.x+3,
																	y=enms.y+3,
																	speedx=rnd(6)-3,
																	speedy=rnd(6)-3,
																	colo=enms.colo,
																	midcolo=enms.midcolo,
																	endcolo=enms.endcolo,																	
																	radius=3+rnd(3),
																	originalradius=0,
																	shrinkrate=0.5}
					newhitpart.originalradius=newhitpart.radius																								
					add(hitparts,newhitpart)												
				end
				sfx(6)												
			end												
			if enms.launcherindex==6 then
				dropbonus("powerup",14,enms)
			end
			if enms.launcherindex==16 then
				dropbonus("lifeup",47,enms)
			end			
			del(allenemies,enms)
		end
		for b in all(bullets) do
			if collision(b,enms) and b.launcher==1 and enms.y>4 then
				del(bullets,b)
				enms.life-=b.dmg
				if enms.launcherindex==13 or enms.launcherindex==15 or enms.launcherindex==18 or enms.launcherindex==6 then
					for i=1,20 do
						newhitpart={x=enms.x+8,
																		y=enms.y+3,
																		speedx=rnd(6)-3,
																		speedy=-rnd(6),
																		colo=enms.colo,
																		midcolo=enms.midcolo,
																		endcolo=enms.endcolo,																	
																		radius=3+rnd(2),
																		originalradius=0,
																		shrinkrate=0.5}
						newhitpart.originalradius=newhitpart.radius																								
						add(hitparts,newhitpart)
					end
				else
					for i=1,20 do
						newhitpart={x=enms.x+3,
																		y=enms.y+3,
																		speedx=rnd(6)-3,
																		speedy=-rnd(6),
																		colo=enms.colo,
																		midcolo=enms.midcolo,
																		endcolo=enms.endcolo,																	
																		radius=3+rnd(2),
																		originalradius=0,
																		shrinkrate=0.5}
						newhitpart.originalradius=newhitpart.radius																								
						add(hitparts,newhitpart)
					end												
				end
				sfx(2)				
			end
		end
	end
	if wavetiming==0 then		
		if t==60 then		
			spawnenemies({alien},{30,-10},{30,130})
		end
		if t==60*4 then		
			spawnenemies({alien},{100,-10},{10,130})
		end
		if t==60*6 then		
			spawnenemies({alien,alien},{30,-20,110,-10},{70,80,80,130})
		end
		if t==60*9 then		
			spawnenemies({alien},{90,-20},{-10,130})
		end	
		if t==60*10 then		
			spawnenemies({alien},{90,-10},{-10,130})
		end	
		if t==60*11 then		
			spawnenemies({superalien},{30,-10},{30,130})
		end
		if t==60*14 then		
			spawnenemies({bonuship,alien},{75,-20,30,-30},{90,130,130,100})
		end		
		if t==60*18 then		
			spawnenemies({kamikaze,kamikaze,kamikaze,kamikaze},{70,-10,20,-20,100,-30,40,-40},{})
		end
		if t==60*19 then		
			spawnenemies({kamikaze,kamikaze,kamikaze,kamikaze},{10,-10,60,-20,110,-30,30,-40},{})
		end					
		if t==60*20 then		
			spawnenemies({kamikaze,kamikaze,kamikaze,kamikaze},{80,-10,50,-20,10,-30,110,-40},{})
		end					
		if t==60*21 then	
			spawnenemies({kamikaze,kamikaze,kamikaze,kamikaze},{20,-10,100,-20,60,-30,120,-40},{})		
		end
		if t==60*23 then		
			spawnenemies({alien},{30,-10},{50,130})
		end											
		if t==60*24 then		
			spawnenemies({alien},{110,-10},{20,130})
		end
		if t==60*25 then		
			spawnenemies({alien,alien,alien},{20,-10,30,-20,40,-30},{50,130,70,130,90,130})
		end																							
		if t==60*26 then		
			spawnenemies({superalien},{90,-10},{-10,100})
		end
		if t==60*29 then		
			spawnenemies({vshooter},{35,-10},{})
		end
		if t==60*30 then		
			spawnenemies({alien,alien},{85,-10,100,-10},{70,130,90,130})
		end
		if t==60*31 then		
			spawnenemies({ultraalien},{92,-10},{})
		end
		if t==60*37 then		
			spawnenemies({spiralshooter},{60,-10},{60,50})
		end
		if t==60*38 then		
			spawnenemies({superalien},{25,-10},{45,130})
		end
		if t==60*39 then		
			spawnenemies({alien},{70,-10},{70,130})
		end
		if t==60*40 then		
			spawnenemies({alien},{90,-10},{100,130})
		end
		if t==60*41 then		
			spawnenemies({alien,superalien},{15,-10,100,-30},{35,130,20,130})
		end
		if t>=60*41 and wavetiming==0 and #allenemies==0 then
			wavetiming=1
			t=0
		end
	end
	if wavetiming==1 then	
		if t==60*2 then		
			spawnenemies({bonuship},{15,-10},{})
		end
		if t==60*4 then		
			spawnenemies({ultraalien},{60,-10},{})
		end
		if t==60*5 then		
			spawnenemies({kamikaze,kamikaze,kamikaze},{30,-10,105,-20,45,-30},{})
		end
		if t==60*7 then		
			spawnenemies({superalien,kamikaze,kamikaze,kamikaze},{90,-10,60,-10,60,-25,60,-40},{100,130})
		end
		if t>=60*7 and wavetiming==1 and #allenemies==0 then
			wavetiming=2
			t=0
		end		
	end
	if wavetiming==2 then
		if t==60*2 then		
			spawnenemies({alienboss},{56,-20},{})
		end
		if t>=60*2 and wavetiming==2 and #allenemies==0 then
			wavetiming=3
			t=0
		end
	end
	if wavetiming==3 then
		if t==60*2 then		
			spawnenemies({lifedropper},{60,-10},{})
		end
		if t==60*6 then		
			spawnenemies({randomshooter},{90,-10},{})
		end
		if t==60*10 then		
			spawnenemies({alien},{60,-10},{20,130})
		end
		if t==60*11 then		
			spawnenemies({alien},{60,-10},{20,130})
		end														
		if t==60*12 then		
			spawnenemies({alien},{60,-10},{20,130})
		end								
		if t==60*14 then		
			spawnenemies({detonater},{20,-10},{})
		end
		if t==60*19 then		
			spawnenemies({detonaterboss},{56,-10},{})
		end
		if t>=60*20 and wavetiming==3 and #allenemies==0 then
			wavetiming=4
			t=0
		end
	end	
	if wavetiming==4 then
		if t==60*2 then		
			spawnenemies({alien,alien,superalien,superalien},{45,-10,90,-10,60,-10,75,-10},{50,120,70,120,60,120,70,120})		
		end
		if t==60*3 then		
			spawnenemies({bonuship},{30,-10},{})		
		end
		if t==60*5 then		
			spawnenemies({kamikaze,kamikaze,kamikaze,kamikaze},{45,-10,55,-25,65,-40,80,-55},{})		
		end
		if t==60*8 then		
			spawnenemies({ultraspiralshooter},{60,-10},{60,50})		
		end
		if t>=60*9 and wavetiming==4 and #allenemies==0 then
			wavetiming=5
			t=0
		end																																																																																																																												
	end																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									
end
-->8
--bonus
function dropbonus(bonustype,skin,dropper)
	new_bonus={x=dropper.x,
												y=dropper.y,
												hitboxx1=0,
												hitboxx2=7,
												hitboxy1=0,
												hitboxy2=7,
												speed=0.25,
												skin=skin,
												anim={14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,30,30,30,30,30,30,46,46,46,46,46,46,62,62,62,62,62,62,15,15,15,15,15,15},
												animtimer=1,
												consumed=false,
												txtfxlife=20,
												bonustype=bonustype}
	if dropper.launcherindex==6 then
		new_bonus.x+=8
		new_bonus.y+=8
	end																							
	add(bonus,new_bonus)
end

function updatebonus()
	for b in all(bonus)	do
		if b.bonustype=="powerup" then
			b.skin=b.anim[b.animtimer]
		end	
		b.animtimer+=1
		if b.animtimer>#b.anim and b.consumed==false then
			b.animtimer=1
		end
		if collision(p,b) and b.consumed==false and b.bonustype=="powerup" then
			p.weaponlevel+=1
			b.consumed=true
			sfx(7)	
		end
		if collision(p,b) and b.consumed==false and b.bonustype=="lifeup" then
			p.life+=1
			b.consumed=true
			sfx(7)	
		end		
		if b.consumed==false then
			b.y+=b.speed
			b.speed*=1.001
			b.x+=sin(time()/5)/2
		end	
		if b.y>140 then
			del(bonus,b)
		end
	end
end

function gainscore(scoregain)
	newscoregain={gain=scoregain,
															x=23,
															y=30}
	add(scoregains,newscoregain)														
end

-->8
function shake(intensity)
	shakex=intensity
	shakey=intensity
end

-->8
--galaxy background
function createfrontstars()
	newfrontstar={x=2+rnd(124),
																	y=rnd(128),
																	speed=rnd(1.5)+1.5,
																	colo=7}
	add(stars,newfrontstar)
end

function createforwardstars()
	newforwardstar={x=2+rnd(124),
																	y=rnd(128),
																	speed=rnd(1)+1,
																	colo=6}
	add(stars,newforwardstar)
end

function createbackstars() 
	newbackstar={x=2+rnd(124),
														y=rnd(128),
														speed=rnd(0.8)+0.8,
														colo=5}
	add(stars,newbackstar)													
end

function createplanet()
	for i=1,2 do
		newplanet={x=2+rnd(124),
													y=-rnd(120),
													speed=rnd(0.75)+0.5,
													skin=16+i-1}
		add(planets,newplanet)
	end
end

function createbigplanet()
	for i=1,2 do
		newbigplanet={x=2+rnd(124),
													y=-rnd(120),
													speed=rnd(0.25)+0.10,
													skin=18+(i-1)*2}
		add(bigplanets,newbigplanet)
	end	
end


function updatestars()
	for s in all(stars) do
		s.y+=s.speed
		if s.y>=128 then
			s.y=0
			s.x=rnd(120)
		end
	end
end

function updateplanets()
	for p in all(planets) do
		p.y+=p.speed
		if p.y>=128 then
			p.y=-120-rnd(200)
			p.x=rnd(120)	
		end
	end
end

function updatebigplanets()
	for p in all(bigplanets) do
		p.y+=p.speed
		if p.y>=128 then
			p.y=-120-rnd(200)
			p.x=rnd(120)
		end
	end
end
-->8


__gfx__
ffaa000000055000000550000005500000e88e00e082280e82eeee28000bb0000cc11cc000200e0000e0080000000000000000000000000000bbbb0000777700
00000000005dd500005dd500005dd5000ee22ee0088ee8802e8888e200033000c16c761c00888800002222000000000000000000000000000bc11cb00bc11c70
00700700005dd500005dd500005dd5000822228002eeee200e8888e000333300c16cc61ce8822882822ee22e000aa000000cc00000011000bc1aa1cbbc1aa1c7
0007700005dc7d5005d7dd5005dd7d50822222282eeeeee2e888888e003bb3000c1dd1c0082ee28002e88e2000af9a0000c77c00001c7100b11aa11bb11aa117
000770005d5cc5d505dc5d5005d5cd5082e22e282e8ee8e2e828828e03baab30001cc100082ee28002e88e2000a9fa0000c77c00001cc100b11a111bb11a1117
007007005d5115d505d15d5005d51d50828228282e2ee2e2e8e88e8e037007300c7117c02882288ee22ee228000aa000000cc00000011000bc1a11cbbc1a11c7
000000005555555505555550055555500e2882e008e22e80028ee8203b0000b30110011000888800002222000000000000000000000000000bc11cb00bc11cb0
000000000670067000600700007006000e0000e00800008002022020370000730c7007c000e0020000800e0000000000000000000000000000bbbb0000bbbb00
0044440000444400000003c6666000000d00000000000000000088888888000009333330008888000080020000000000000110000011110000bbbb0055555ddd
044f44f009ff4440000633cc66636000010000000d1110d00008844444488000abb3366b0822228000eeee000000000000111100017777100bc11cb05111111d
44f5f4459faaa44400633cc3333344000000000dd11000000088422222248800bb73336b82e22e282ee88ee8000ff00000177100017cc7107c1aa1cb51cc661d
544f44449faaa4f406633ccc33334440010001111110000000842222222248003b773bb3828228280e8228e000f9af000017c10001cccc10711aa11b51ccc615
444444449fa9aaf4063c66c63333334001001155551d00000084e222222e48000333bbba082222800e8228e000fa9f00001cc100001cc100711a111b051cc150
f4444544999aaaf444c666ccccc3333301111511115dd0000088ee2222ee88003000bbba008228008ee88ee2000ff000001cc100001111007c1a11cb051cc150
0544f5f00999ff40ccc66c334466c3330d115101001510000008eee22eee800093bbb393008ee80000eeee0000000000000cc0000000000007c11cb000511500
00444f00009444003cc6644444666c340011510001151100088848e22e8488800a33390008e00e80002008000000000000000000000c10000077770000055000
00000000000000003336c444436666cc00d1511000151d0088442882288244880f222220055665504990099400000000000000000000000000bbbb0000000070
00000000000000003336c4433446664c000d5100101511d084222282282222488ee2266e55dddd554a9999a400000000000000000000000007c11cb0555dd777
00000000000000003333ccc6644ccc3c000d1511115111108422222222222248ee72226e5d5555d54aa99aa4000990000000000000000000771aa1cb51111777
0000000000000000033cccc664ccccc00000115555d1001088444288884444882e772ee26d5c75d604aaaa40009af9000000000000000000b77aa11b51cc7170
0000000000000000033ccc6c34c4ccc0000001111dd000d0088ee48008eee8800222eeee6d5cc5d604aaaa40009fa9000000000000000000b777111b51ccc170
00000000000000000044cccc4ccccc000000011110000000008eeee00eeee8002000eee85d5555d504faaf40000990000000000000000000bc7771cb051c1570
00000000000000000004cccc4cc660000001ddd000000010000eee0000eee00082eee2f255dddd55004ff4000000000000000000000000000bc77770051c1500
000000000000000000000666666000000d000000000000d0000ee000000ee0000f222800055665500004400000000000000000000000000000bbb70000555000
00aa0000000aa00000000000000111000001110000011100000111000000000000000000000000000000000000000000000000001c0710c1007bbb0000000000
0af9a00000a9fa000aa0aa00001ccc10001ccc1000177710001ccc1000030000000030000000030000300000000000000000000010c17c0107777cb000000000
0a9faa000aaf9a00a9faf9a001cc7cc101c777c1017ccc7101ccccc10033330000335300033553000035333000000000000cc0001c0710c1bc1777cb00000000
0aaa9fa0af9aa000af9a9fa001c777c101c7c7c1017ccc7101ccccc1005bb530033bb500003bb300005bb3000000000000c1d70010c17c01b11a777b00000000
a9faf9a0a9ff9a000a9faa0001cc7cc101c777c1017ccc7101ccccc1035bb500005bb330003bb300003bb5000000000000c11c001c0710c1b11a177b00000000
af9aaa000aa9fa000af9a000001ccc10001ccc1000177710001ccc1000333300003533000035533003335300000000000006c00010c17c01bc1a117700000000
0aa00000000aa00000aa0000000111000001110000011100000111000000300000030000003000000000030000000000000000001c0710c10bc11c7000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010c17c0100bbbb0000000000
0000000000000000000000000000000000000000080000000000020000e000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000008008080000000002200ee000000000000000000000000000000000000000000000000000000000000000000000
000000000040000000000000000000000000088e2882000000000eeeeee000000000cccccccc00000000cccccccc000000007777777777700000000000000000
000044400044400000082000228000000008e28888e200000000effffffe0000000cc111111cc000000c11111111c00000770000000000700000000000000000
00444044220044000002828888200000000088eeee882000000ef888888fe000000c16cc7761c000000c16cc7761c00007700077700007700000000000000000
0040022000220400000228e22282808000008e222228e800eeef88222288fe22000c16ccc761c000000c16ccc761c00007007744477077700000000000000000
0400020000020400000282822e2888008888e2e2222282000eef822ee228fe20000c11cccc11c000000c11cccc11c00007007044407070000000000000000000
0000200000002000002282222828220000e8e2822e228e0000ef82e22e28fe000000c11dd11c00000000c11dd11c000007074400404770000000000000000000
0000200000002000088882222228220000e8e2222822888000ef82e22e28fe0000000c1cc1c0000000000c1cc100000007774404404777000000000000000000
000020000000200000028222222888000028e2222222880002ef822ee228fee00000cc7007cc00000000cc700700000007474444444747000000000000000000
0004020000020000000288222282228008888e222228228022ef88222288feee0000111001110000000011100000000007774400444777000000000000000000
00000220002200000008228888220000008e88e22288e008000ef888888fe0000000cc7007cc00000000cc700000000000007400047000000000000000000000
0000000222000000000000282282000008e22288888080000000effffffe00000000111001110000000011100000000000007744477000000000000000000000
0000000000000000000000000008000000002808e280080000000eeeeee0000000000c7007c0000000000c700000000000000077700000000000000000000000
00000000000000000000000000000000000080080080000000000ee0022000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000080000000000e00002000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000080800000000000000000000000000000808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0010000000070050500000005050000700e0502461500000000702461500000000700007002050050500000000070000000505024615000700e05024615000000007000000000000505000070020502461500000
0001000027010210101b010180101601014010130101201011010110102e0002d0002d0002c0002c0002a00028000200001a00018000160001500014000120000f0000d000090001470004000020001670018700
000100002b63026620236101f6101b61018610166101461012610116100f6000d6000c6000b6000a60022600006000f60022600276002d60030600326001f6000060018600006001f60000600006002e60000600
000100002b23026220232101f2101b210182101621014210122101121000200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200
0001000013050130501303013020140101501018010200102a0103f01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00030000276502b6502e650306303164032640326303263032630306302c63027630236301f6201e6201e620206202362025620276202762025620216101e6101b61019610196101b61019610186101861000000
00010000295502b550356502f550305503153031530315303a6303152031520305202e5202b520316202852024510215101d5101a51016510236100e51007510045100f500000001a50017600000001760000000
000100000f010110101201011010100200d0200b0200d0201102014020180201b0201d0301e0301e0301c0301903018030170301703017040190401a0401d0402004024040280502c0503105035050390503b050
00010000391503a1503b1503b1503b1503b150391503715034150301502d1502a150291502a1502b1502d1502f1503015030150301502f1502c15028150221501d1501a15017150121500f1500f1500e1500b150
000300002d1302f130301303113031130301302e1302b13027130201301d1301b1301a1201a1201a1201a1201b1201c1201e1202012022120221202212022120211101f1101c11018110101100b1100911008110
0001000020050200501f0500000000000000001e05000000000001e050000000000000000000001d05000000000000000000000000001c05000000000001b0500000000000000000000000000190500000000000
__music__
03 00474344

