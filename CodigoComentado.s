         .data                                    

mensagem:.asciiz"Digite o numero para o Vetor:\n" 
vet:     .word 5                                  #Declarando um vetor com nome vet de 5 posições

         .text

main:    addi $s0,$zero,0                         #Cria um registrador de nome $s0
         addi $s1,$zero,5                         #Cria um registrador de nome $s1
         addi $s2,$zero,4                         #Cria um registrador de nome $s2

for_1:   slt $t0,$s0,$s1                          #Faz uma verificação, se $s3 for maior que $t0, vai amarzenar 0, se não vai armazenar 1
         beq $t0,$zero,f_for_1                    #Faz um comparação, pra ver se tem um ou 0, se estiver 0 entra no if, se não pula para o fim do if
         addi $v0, $zero, 4                       #Codigo para imprimir string
         la $a0, mensagem                         #Carregar mensagem
         syscall                                  #Imprimir na tela
         addi $v0, $zero, 5                       #Codigo para lê inteiro
         syscall                                  #Lê do teclado
         mul $s2, $s2, 4                          #Faz uma multiplicação do que está na posição $s2 e multiplica por 4
         sw $v0,vet($s2)                          #Adciona um vetor na memoria, o quê está no registrador $v0 ma posição $s2
         addi $s0,$s0,1                           #Faz uma soma adicionando 1 no $s0
         j for_1                                  #Manda pular para o for 1

f_for_1: addi $s0,$zero,0                         #Cria um registrador de nome $s0
         addi $s1,$zero,5                         #Cria um registrador de nome $s1
         addi $s2,$zero,4                         #Cria um registrador de nome $s2
         mul $s2,$s2,4                            #Faz uma multiplicação do que está na posição $s2 e multiplica por 4
         addi $s3,$zero,0                         #Cria um registrador de nome $s3
         lw $s3,vet($s2)                          #Pega da memoria o vetor na posição que está dentro do registrador $s2
         
for_2:   slt $t0,$s0,$s1                          #Faz uma verificação, se $s3 for maior que $t0, vai amarzenar 0, se não vai armazenar 1
         beq $t0,$zero,f_for_2                    #Faz um comparação, pra ver se tem um ou 0, se estiver 0 entra no if, se não pula para o fim do for 2
         mul $s2,$s2,4                            #Faz uma multiplicação do que está na posição $s2 e multiplica por 4
         lw $t0,vet($s2)                          #Pega da memoria o vetor na posição que está dentro do registrador $s2

if:      sgt $t1,$t0,$s3                          #Faz uma verificação, se $s3 for menor que $t0, vai amarzenar 0, se não vai armazenar 1
         beq $t1,$zero,f_if                       #Faz um comparação, pra ver se tem um ou 0, se estiver 0 entra no if, se não pula para o fim do if
         add $s3,$zero,$t0                        #Adciona no registrador $s3 o quê estava no registrador temporario $t0

f_if:    addi $s0,$s0,1                           #Faz uma soma adicionando 1 no $s0
         j for_2                                  #Manda pular para o for 2
                                                       
f_for_2: addi $v0,$zero,1                         #Codigo para imprimir inteiro
         la $a0,($s3)                             #Carregando o inteiro
         syscall                                  #Imprimindo na tela
         jr $ra                                   #Codigo para fechar sem dar erro