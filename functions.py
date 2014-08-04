import numpy as np

def DiceRoller(n_rolls):
	try:
		dice = int(n_rolls)
	except ValueError:
		print("Number of dice to roll needs to be an integer")
	rolls = np.random.random_integers(5, size=(1.,dice))
	return rolls

def Shooting(BS, n_shots):
	try:
		BS = int(BS)
	except ValueError:
		print("BS needs to be an integer")
	try:
		n_shots = int(n_shots)
	except ValueError:
		print("Number of shots needs to be an integer")
	shots = DiceRoller(n_shots)
	hits = np.sum(shots.__le__(BS))
	return hits

def Wounding(S, T, hits):
	try:
		S = int(S)
	except ValueError:
		print "Strength (S) must be an integer"
	try:
		T = int(T)
	except:
		print "Toughness (T) must be an integer"
	try:
		hits = int(hits)
	except:
		print "Number of hits must be an integer"

	
a = Shooting(3,5)







print a