-- 
-- Abstract: JungleScene sample project
-- Demonstrates sprite sheet animations, with different frame rates
-- 
-- Version: 1.0
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

-- Plants are from http://blender-archi.tuxfamily.org/Greenhouse
-- and are subject to creative commons license, http://creativecommons.org/licenses/by/3.0/

local sprite = require "sprite"
display.setStatusBar( display.HiddenStatusBar )

-- The sky as background
local sky = display.newImage( "sky.jpg" )

local baseline = 280

-- a bunch of foliage
local tree = {}
tree[1] = display.newImage( "Palm-arecaceae.png" )
tree[1].xScale = 0.7; tree[1].yScale = 0.7
tree[1]:setReferencePoint( display.BottomCenterReferencePoint )
tree[1].x = 20; tree[1].y = baseline
tree[1].dx = 0.1
tree[2] = display.newImage( "Greenhouse-Palm-jubaea01.png" )
tree[2].xScale = 0.6; tree[2].yScale = 0.6
tree[2]:setReferencePoint( display.BottomCenterReferencePoint )
tree[2].x = 120; tree[2].y = baseline
tree[2].dx = 0.2
tree[3] = display.newImage( "Greenhouse-Palm-cycas01.png" )
tree[3].xScale = 0.8; tree[3].yScale = 0.8
tree[3]:setReferencePoint( display.BottomCenterReferencePoint )
tree[3].x = 200; tree[3].y = baseline
tree[3].dx = 0.3
tree[4] = display.newImage( "Ginger.png" )
tree[4].xScale = 0.7; tree[4].yScale = 0.7
tree[4]:setReferencePoint( display.BottomCenterReferencePoint )
tree[4].x = baseline; tree[4].y = baseline
tree[4].dx = 0.4
tree[5] = display.newImage( "Greenhouse-Palm-acai01.png" )
tree[5].xScale = 0.8; tree[5].yScale = 0.8
tree[5]:setReferencePoint( display.BottomCenterReferencePoint )
tree[5].x = 300; tree[5].y = baseline
tree[5].dx = 0.5
tree[6] = display.newImage( "Dracena.png" )
tree[6].xScale = 0.4; tree[5].yScale = 0.4
tree[6]:setReferencePoint( display.BottomCenterReferencePoint )
tree[6].x = 320; tree[6].y = baseline
tree[6].dx = 0.6
tree[7] = display.newImage( "Banana.png" )
tree[7].xScale = 0.4; tree[7].yScale = 0.4
tree[7]:setReferencePoint( display.BottomCenterReferencePoint )
tree[7].x = 380; tree[7].y = baseline
tree[7].dx = 0.7
tree[8] = display.newImage( "Bamboo-rgba.png" )
tree[8].xScale = 0.8; tree[8].yScale = 0.8
tree[8]:setReferencePoint( display.BottomCenterReferencePoint )
tree[8].x = 420; tree[8].y = baseline
tree[8].dx = 0.8

-- A sprite sheet with a cat
local sheet1 = sprite.newSpriteSheet( "runningcat.png", 512, 256 )

local spriteSet1 = sprite.newSpriteSet(sheet1, 1, 8)
sprite.add( spriteSet1, "cat", 1, 8, 1000, 0 ) -- play 8 frames every 1000 ms

local instance1 = sprite.newSprite( spriteSet1 )
instance1.x = display.contentWidth / 4 + 40
instance1.y = baseline - 75
instance1.xScale = .5
instance1.yScale = .5

instance1:prepare("cat")
instance1:play()

-- A sprite sheet with a green dude
local sheet2 = sprite.newSpriteSheet( "greenman.png", 128, 128 )

local spriteSet2 = sprite.newSpriteSet(sheet2, 1, 15)
sprite.add( spriteSet2, "man", 1, 15, 500, 0 ) -- play 15 frames every 200 ms

local instance2 = sprite.newSprite( spriteSet2 )
instance2.x = 3 * display.contentWidth / 4 + 30
instance2.y = baseline - 55

instance2:prepare("man")
instance2:play()

-- Grass
-- This is doubled so we can slide it
-- When one of the grass images slides offscreen, we move it all the way to the right of the next one.
local grass = display.newImage( "grass.png" )
grass:setReferencePoint( display.CenterLeftReferencePoint )
grass.x = 0
grass.y = baseline - 20
local grass2 = display.newImage( "grass.png" )
grass2:setReferencePoint( display.CenterLeftReferencePoint )
grass2.x = 480
grass2.y = baseline - 20

-- solid ground, doesn't need to move
local ground = display.newRect( 0, baseline, 480, 90 )
ground:setFillColor( 0x31, 0x5a, 0x18 )

-- A per-frame event to move the elements
local tPrevious = system.getTimer()
local function move(event)
	local tDelta = event.time - tPrevious
	tPrevious = event.time

	local xOffset = ( 0.2 * tDelta )

	grass.x = grass.x - xOffset
	grass2.x = grass2.x - xOffset
	
	if (grass.x + grass.contentWidth) < 0 then
		grass:translate( 480 * 2, 0)
	end
	if (grass2.x + grass2.contentWidth) < 0 then
		grass2:translate( 480 * 2, 0)
	end
	
	local i
	for i = 1, #tree, 1 do
		tree[i].x = tree[i].x - tree[i].dx * tDelta * 0.2
		if (tree[i].x + tree[i].contentWidth) < 0 then
			tree[i]:translate( 480 + tree[i].contentWidth * 2, 0 )
		end
	end
end

-- Start everything moving
Runtime:addEventListener( "enterFrame", move );