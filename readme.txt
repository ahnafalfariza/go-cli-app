GO-CLI-APP
SOFTWARE ENGINEERING ACADEMY COMPFEST
Ahnaf M Alfariza

RUNNING THE APP
To run go-cli app we can have 3 options parameter
1. Running with 3 parameters
   -The parameters are n, x, y.
     n = map size
     x = coordinate user
     y = coordinate user

2. Running with 1 parameter
   -The parameter is the filename
   -The map will be generated from file
   -Formatfile:
	----------
	D-----D---
	----------
	----------
	----D-----
	--U-------
	----------
	----------
	----D---D-
	----------
    it must consist a user and five driver, and map with size nxn
    This app can only read letter : "D", "U", "-" and NOSPACE
   -I already attached example of input in zip

3. Running with no parameter
   -Will generate 20x20 map size and random user position


WHILE THE APP IS RUNNING:

	WELCOME TO GO-CLI APP
	Your Smart CLI App
	Main menu
	1. Show Map
	2. Order Go-Ride
	3. Show History
	4. Exit
	Your input: 

There are 4 option, while running
1. Show map
   -This will print the map
   -Example:

	Your input: 1
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  D  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  D  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  D  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  D  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  U  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 
	 .  .  .  .  .  .  .  .  .  D  .  .  .  .  .  .  .  .  .  . 	

2. Order Go-Ride
   -You will be asked where the destination coordinate
   -Then we locate the nearest driver
   -Show the route to the destination
   -Show the estimate price
   -Print the receipt to the file
   -Example:

	Your input: 2
	Where do you want to go?
	you are in position [19, 5]
	 x: 2
	 y: 3

	Your nearest driver is Andi at position [18, 10] 
	The route is
		start at (19,5)
		go to (2,5)
		turn left
		go to (2,3)
		finish at (2,3)
	Distance : 19
	The price is 5700

	Do you want to continue? (y/n) y

	You traveled to [2, 3]
	Your order is completed

	RECEIPT GO-RIDE
	 Thank you for using Go-Ride
	 From [19, 5] to [2, 3]
	 Driver name Andi from location [18, 10]
	 The route is
		start at (20,6)
		go to (3,6)
		turn left
		go to (3,4)
		finish at (3,4)
	 Distance : 19
	The price is 5700

3. Show History
   -It will return the order history
   -Example:

	1. RECEIPT GO-RIDE
	 Thank you for using Go-Ride
	 From [19, 11] to [1, 1]
	 Driver name Chris from location [14, 12]
	 The route is
		start at (20,12)
		go to (2,12)
		turn left
		go to (2,2)
		finish at (2,2)
	 Distance : 28
	The price is 8400

	2. RECEIPT GO-RIDE
	 Thank you for using Go-Ride
	 From [1, 1] to [4, 4]
	 Driver name Bobi from location [3, 9]
	 The route is
		start at (2,2)
		go to (5,2)
		turn left
		go to (5,5)
		finish at (5,5)
	 Distance : 6
	The price is 1800
	
4. Exit
   -Close the app


CLASS CONSTRUCTION
1. main.rb
   -This is the main program
   -Handle the menu and user input

2. user.rb
   -Class for user
   -It can locate where the user is

3. gocli.rb
   -Generate map
   -Display map
   -Update map

4. driver.rb
   -Order go-ride
   -Find the nearest driver
   -Show the route to the destination
   -Calculate the estimate price   

5. history.rb
   -Record the history of the order
   -Display the history


ASSUMPTIONS
-The user coordinate should in range 1 to map size
-We can have multiple order while the app is running.
-If we order more than one, the position/coordinate of the driver and user should change
-The current position of user will change to destination position if the order is completed
-If we make a new order, the driver position should've different from before
-We can't have user and driver in same coordinate
-We can't have two or more driver in same coordinate
-The input file is a square map with a user and 5 driver included
-We can't order go-ride to same position 


APP DESIGN
-If run from file, my app will read the file as a string and convert it to array by splitting
-After go-ride order complete, my app will generate a new map, and the destination from the last order become the current user position
-After go-ride order complete, the receipt will be write in textfile "receipt"
-The map coordinate is from 1 to map size
-I use to store the map in Array, since array is start from 0, so i have to plus the array by 1 or minus the coordinate by 1 to match between the array and the map coordinate
-It has different method to generate map from parameter and generate map from file
-The history are automatically added after the order complete
-The history are array of string, so it will be easier to add the history and print history 
-We can't order go-ride to same position
-
