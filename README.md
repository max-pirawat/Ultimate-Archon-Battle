# Ultimate Archon Battle
#### Video Demo: https://youtu.be/cN_RSi7hjDM
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

There are 2 main parts -- board and battle.

Board are draw as tiles. Each piece is object with different sprites. obj_b_controller handles keyboard events, move pieces and goto battle room.

In battle room, there will be an object for each player -- obj_player1 and obj_player2. Each specific piece will be a child of these objects. Object
events are used to do shooting or getting shot (In newer GMS2 version, we can use method variable instead.)
