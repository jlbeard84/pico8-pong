pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
--paddle
padx=52
pady=122
padw=24
padh=4

--ball
ballx=64
bally=64
ballsize=3
ballxdir=5
ballydir=-3

function movepaddle()
 if btn(0) then
  padx-=3
 elseif btn(1) then
  padx+=3
 end
end

function bounceball()
 --left
 if ballx<ballsize then
  ballxdir=-ballxdir
  sfx(1)
 end
 
 --right
 if ballx>128-ballsize then
  ballxdir=-ballxdir
  sfx(1)
 end
 
 --top
 if bally<ballsize then
  ballydir=-ballydir
  sfx(1)
 end
end

function bouncepaddle()
 if ballx>=padx and
    ballx<=padx+padw and
    bally>pady then
    
    sfx(0)
    ballydir=-ballydir
 end
end

function moveball()
 ballx+=ballxdir
 bally+=ballydir
end

function _update()
 movepaddle()
 bounceball()
 bouncepaddle()
 moveball()
end

function _draw()
 --clear screen
 rectfill(0,0,128,128,3)
 
 --draw paddle
 rectfill(padx,pady,padx+padw,pady+padh,15)
 
 --draw ball
 circfill(ballx,bally,ballsize,15)
end


__sfx__
000400003407000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100001c05000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
