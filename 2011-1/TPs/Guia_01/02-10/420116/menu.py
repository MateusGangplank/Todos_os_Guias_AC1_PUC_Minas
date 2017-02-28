import glob
from run import executa_exercicio

cmd = -1
arquivos = glob.glob('*.v')

while cmd != 0:
    print '0 - Sair'
    c = 1
    for arquivo in arquivos:
        print '%s - %s' % (c, arquivo.split('.')[0])
        c += 1
    cmd = int(raw_input('Digite o numero do arquivo que sera executado: '))
    
    if cmd > 0 and cmd <= len(arquivos):
        print '\n'
        executa_exercicio(arquivos[cmd].split('.')[0])
    print '\n'
