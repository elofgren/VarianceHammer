import numpy as np
import random as rand

def DiceRoller(n_rolls):
	try:
		dice = int(n_rolls)
	except ValueError:
		print("Number of dice to roll needs to be an integer")
	rolls = np.random.random_integers(6, size=(1.,dice))
	return rolls

# Caution - does not work with BS 6+
def Shooting(BS, n_shots, twinlinked):
	try:
		BS = int(BS)
	except ValueError:
		print("BS needs to be an integer")
	try:
		n_shots = int(n_shots)
	except ValueError:
		print("Number of shots needs to be an integer")
	if twinlinked == "Y":
		shots = DiceRoller(n_shots)
		shots[shots > BS] = rand.int(1,6)
	elif twinlinked =="N":
		shots = DiceRoller(n_shots)
	else:
		shots = DiceRoller(n_shots)

	hits = np.sum(shots.__ge__(7-BS))
	return shots,hits

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