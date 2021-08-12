# Ultimate Archon Battle
#### Video Demo: https://youtu.be/cN_RSi7hjDM
#### Github: https://github.com/max-pirawat/Ultimate-Archon-Battle
#### Play Now: https://max-pirawat.github.io/Ultimate-Archon-Battle/UABhtml5
#### Description:
Two-player battle game with extra fun! Made with Gamemaker Studio 2. The game is inspired by Archon (1983).

This is CS50 final project. See release for the game binaries.

##### Gameplay

![Screenshot 2021-07-14 010520](https://user-images.githubusercontent.com/60696957/125503149-04f380c0-50a6-4615-9e97-ea0fe825f539.png)

The objective is to eliminate the other team. The game is played on 8x8 chessboard. Player take turns moving pieces. Some pieces can only walk.
This means you can't walk through enemies and friends. The other pieces can fly. This means you can fly over anyone.

![Screenshot 2021-07-14 010625](https://user-images.githubusercontent.com/60696957/125503178-31841b14-04a5-4b3d-b451-ab0d4f5b7546.png)

When two pieces meet, the battle happens until someone dies. In battle there will be bushes. Bushes will protect you from bullets. 
But beware! The bushes can disappear. There can also be apples. Green apples can heal you 5 hp. Red apples will give powerup. For yellow, you will shoot faster.
For purple, you will shoot triple bullets. After 30 seconds, a golden apple will appear randomly. Golden apple will give your bullets homing ablility.

##### Control

Yellow team controls:
- move is WASD
- select/shoot is space bar

Purple team controls:
- move is arrow keys
- select/shoot is enter

Please ESC to exit the game.

Some keyboard will not respond to too many simultaneously keystrokes. You can plug in external keyboard and play separately.

##### Code Structure

There are 2 main rooms -- board room and battle room.

Board room are drawn as tiles with pieces as objects. These are called player objects (obj_player) as they are controlled by players. Each player object
has name, sprite for up down and left, HP, max HP, board moves, fly/walk boolean, battle move speed, battle fire speed, fire cooldown and bullet type.
These can be set in variable window of an object. So, they are easy to change and add new pieces.
In the board room, the important attributes are name, HP, max HP and bullet as they are used to shown on the yellow and purple panels.
obj_b_controller handles keyboard events, move pieces according to available moves and board size, go to battle room if battle happens, and check if 
one player has won or draw.

In battle room, there will be an object for each player -- obj_player1 and obj_player2. Both are child of obj_player. Code common to both player 1 and player 2
are in obj_player. Each specific piece will be a child of these objects e.g. obj_manticore is child of obj_player2. User
events are used for actions that are different for different pieces or needed to be invoked by other objects like do shooting or getting shot so that 
specific piece can shoot different bullets or has different power up. In newer GMS2 version, we can use method variables instead as they are more convenient. 

Each piece has its own bullet e.g. obj_manticore has obj_manticore_bullet. obj_manticore_bullter has obj_player2_bullet as parent. obj_player2_bullet, in turn,
has obj_bullet as parent. Some bullet has special ability. obj_player1_fire_bullet has poison-like attack. obj_player2_confuse_bullet can reverse player direction 
for a while.

Bushes and apples are put randomly on the battlefield. Bushes are put when the room start. Bushes randomly disappears and move to a new location. Apples are 
put off screen when the room start and randomly move to a random location on the room. Golden apple are put at a random location on screen only after 30 second.
This is done to make the fight more exciting if it is taking too long as homing bullet is very hard to dodge.

The bullet also can do homing. This happens when a player has eaten golden apple. The homing is done by changing direction of bullet to enemy instead of going straight.

The battle room is controlled by obj_controller, which handle keyboard events, move the players accordingly, set up the room and check if one player has died so that we can return to board room.

There was a bug in GMS2 that deactivated pieces (not in combat) from the board room is still collidable with bullets. The workaround is to double the battle room height.
The battle happens on the bottom halves to avoid hitting hidden pieces. 
