  local quadInfo = { 
    {'U', 0,  0 }, -- 1 = floor grass
    {'N', 32,  0 }, -- 2 = grass bridge
    {'Q',  0, 32 }, -- 3 = solid ground
    {'J', 32, 32 }, -- 4 = quad ground
}
   local tileString = [[
    UUUUUJJJJ
    NNNNNNNNN
    UUUUUQQQQ
   ]]
   --do not need to have quadinfo and tilestring
   --because it's initialized up above.
   newMap(32,32,'/images/countryside.png',quadInfo,tileString)