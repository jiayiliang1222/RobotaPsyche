## Description
This assignment is to simulate an ecosystem using the concepts we learn from chapters of <The Nature of Code>. In the virtual ecosystem, there are a number of computational creations that swim in a pond,and inteact with each other with a set of rules. 
I put three main creatures in my pond, which are frogs, tadpoles, and the algae. Here are the rules I set for my ecosystem:
  - Frogs attract the tadpoles. Frogs move slowly at first, then accelerate. When the velocity reaches a certain limit, the frogs will stop and restart moving, which simulates how frogs swim in the real life. Frogs will change their directions when reach the edge of the pond. 
  - Algae is the food source which also attracts the small tadpoles that need food to grow. I make the mass of the algae so much larger than the frog to make the attractiveness of food higher than the frog. 
  - There are two groups of tadpoles with different colors. Each group follows one frog, and they are all work as predators that are attracted by the algae in the middle of the pond. The tadpoles will repel the tadpoles with different colors. 
  - The hunger level of each tadpoles determines how fast the tadpoles move. More hungry the tadpole is, the faster it moves.
  - I try to make use of the concept of particles to build a lifespan for each tadpole, but due to my lack of experience in managing the boolean statement, I fail to accomplish this goal. This is what I could improve for this project in the future.
## Screenshots and Video
<img src="Screenshot1.png" width="400">
<img src="Screenshot2.png" width="400">
<img src="Screenshot3.png" width="400">

  [Link to video](https://youtu.be/V4nKdK6XWYc)

  ## Major Problems and Solutions
  There are several difficulites I face:
 - The major problem for me is to let the movers(tadpoles) attracted by a moving attractor (Frog), especially when the frog is moving in a quite complex mode. After a while of exploration, I find the solution is quite easy. Since the attraction force is determined by the relative location of two objects, it does not matter a lot whether the attractor is moving. All I have to do is to add the actions of frogs in the update function. 
  - Another problem is to make two groups of tadpoles with different colors. To solve this problem, I add a value called myColor in Tadpole(float _mass_, int myColor) of the class function. I set the black color to be 1, and the gray color to be 2. When I initialize the Tadpole class in setup(), I just create two groups with new Tadpole() with different myColor.
  - As is mentioned, the lack of acknowledgement of the boolean statement makes me fail to create a lifespan for each tadpole.
  - Now I successfully enable the tadpoles to be attracted by the frogs. However, it is hard to realize the effect that the tadpoles follow and move at the backward of the forgs. It is often to see tadpoles surpass the frogs.
  ## Clever things I learned
  During building my ecology, although I try to build a very organized ecosystem that you can see the tadpoles move clearly after the frogs, the result seems to be a bit of "chaos". However, it is good in some way since it  makes the ecosystem even more similar to the situations in reality. It is inspiring for me to explore the balance between order and chaos while doing this project.
