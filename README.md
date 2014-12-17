# Game of Life

This is Conway's Game of Life, a classic computer science exercise, written in Ruby. The game runs in the command-line interface.

More about the game: [link](https://en.wikipedia.org/wiki/Conway's_Game_of_Life)

The game was a weekend project after completing week 2 of The Iron Yard Academy's (TIY) Ruby on Rails track in Durham, NC.

## Project Requirements\*

This is a simulation which is played on a grid. You set up the initial state of the grid and then watch it evolve over generations.

Your initial state is a set of cells that are alive. For each passing generation, the following happens:

* Any live cell with fewer than two live neighbors dies, as if caused by under-population.
* Any live cell with two or three live neighbors lives on to the next generation.
* Any live cell with more than three live neighbors dies, as if by overcrowding.
* Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

While this game is normally played on an infinite grid, you do not have to necessarily match that model. You could play on a fixed grid (everything outside the grid is dead) or a toroidal grid (each side loops around to the opposite side.)

After you calculate each generation, you should print it out to the screen. The easiest way to do this would be with dots and crosses, like so: https://gist.github.com/cndreisbach/52efbc6670918102dd5f . The sample grid at that link is 20x10 -- you can make any size that makes sense to you.

You should ask the user to hit enter to go to the next generation, or you could have it keep printing them one after another, with a second wait in between them -- your choice.

\* Requirements written by TIY instructor

## Run

To run the game from your terminal, enter the following:

```
ruby lib/game_of_life.rb
```

## Lessons Applied / Learned

This game was an exercise in bringing together object oriented programming concepts before our class jumped into Ruby on Rails.

While the rules of the game were set, I had to make some decisions about how to set up the grid and handle live cells / dead cells.  I chose to keep the live cells for the present generation and prior generation in an array of arrays.  The grid is infinite and the size is based on the position of the live cells.

## Ideas for Improvement

I would love to do the following when I have some time:

* Revisit my code and refactor it; this code was written after just two weeks at The Iron Yard
* Instead of having this run in the terminal, run the game in the browser
* Add the ability for a player to select a pattern (i.e. 'glider' or 'beacon') and a starting point and have the game automatically generate the pattern automatically
