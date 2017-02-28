import sys
import os

def executa_exercicio(nome=None):
    exercicio = nome

    if nome is None:
        if len(sys.argv) > 1:
            exercicio = sys.argv[1]
        else:
            print 'Usage: run.py exercicio'
    if exercicio is not None:
        os.system('iverilog %s.v -o %s.vvp' % (exercicio, exercicio))
        os.system('vvp %s.vvp' % exercicio)

if __name__ == '__main__':
    executa_exercicio()
