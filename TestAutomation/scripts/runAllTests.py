import os
import sys

testCases = os.listdir('../testCases')
executables = os.listdir('../testCasesExecutables')

testCases.sort()
executables.sort() 

for i in testCases:
	f = open("../testCases/" + i, 'r').read().splitlines()
	for j in f:
		print(j)
	print("")
	print("")


print testCases

print executables



