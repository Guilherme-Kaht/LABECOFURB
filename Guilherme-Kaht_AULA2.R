somanota <- 0  
nome <- readline("Insira o nome do aluno: ")

for (i in 1:3) {  
  nota <- as.numeric(readline("Insira a nota: "))  
  somanota <- somanota + nota 
}

media <- somanota / 3  
media <- round(media, 2)

cat("Aluno: ", nome, " - Média: ", media, "\n")
