programa
{
	inclua biblioteca Texto --> T
	inclua biblioteca Util --> U
	
	const inteiro total = 25
	cadeia dataEntrada[total], nome[total], equipamento[total], problema[total], equipamentoCon[total]
	real valorManutencao[total]
	
	funcao inicio()
	{
		menu()
	}

	funcao menu(){
		caracter opcao	
		
		limpa()
		escreva("-----GEEKS TECH-----\n\n")
		escreva("1) Cadastrar novo equipamento\n2) Finalizar manutenção\n3) Fila de atendimento\n4) Consultar próximo atendimento\n5) Buscar equipamento\n6) Status da fila\n7) Equipamentos consertados\n8) Buscar equipamentos consertados\n9) Sair do sistema\n\n")
		leia(opcao)
		limpa()

		escolha(opcao){
			caso '1':{
				cadastroEquipamento()
				pare
			}
			
			caso '2':{
				manutencao()
				pare
			}
			
			caso '3':{
				filaAtendimento()
				pare
			}
			
			caso '4':{
				consultaAtendimento()
				pare
			}
			
			caso '5':{
				buscaEquipamento()
				pare
			}
			
			caso '6':{
				statusFila()
				pare
			}
			
			caso '7':{
				equipamentosConsertados()
				pare
			}
			
			caso '8':{
				buscaEquipamentosConsertados()
				pare
			}
			
			caso '9':{
				sair()
				pare
			}

			caso contrario:{
				menu()
				pare
			}
				
		}
	}

	funcao cadastroEquipamento(){
		escreva("-----CADASTRO EQUIPAMENTO-----\n\n")

		se(equipamento[total-1] != ""){
			escreva("Não há mais espaço para atendimento!\n")
		}senao{
			para(inteiro i = 0; i < total; i++){
				se(dataEntrada[i] == "" e nome[i] == "" e equipamento[i] == "" e problema[i] == ""){
					escreva("Data de entrada: ")
					leia(dataEntrada[i])
	
					escreva("Nome do proprietário: ")
					leia(nome[i])
	
					escreva("Equipamento: ")
					leia(equipamento[i])
					equipamento[i] = T.caixa_alta(equipamento[i])
	
					escreva("Problema: ")
					leia(problema[i])
		
					escreva("\nCADASTRO CONCLUIDO!\n")
	
					pare
				}
			}
		}
		
		retorna()
		menu()
	}

	funcao manutencao(){
		real valor
		caracter opcao

		escreva("-----MANUTENÇÃO-----\n\n")

		se(equipamento[0] != ""){
			escreva("Equipamento: ", equipamento[0], "\n")
			escreva("Problema: ", problema[0], "\n\n")
			escreva("Valor: R$")
			leia(valor)

			escreva("\nDeseja finalizar a manutenção ?")
			escreva("\n1) Sim\n2) Não\n\n")
			leia(opcao)

			escolha(opcao){
				caso '1':{
					para(inteiro i = 0; i < total; i++){
						se(equipamentoCon[i] == ""){
							equipamentoCon[i] = equipamento[0]
							valorManutencao[i] = valor
							pare
						}
					}
			
					para(inteiro i = 0; i < total-1; i++){
						dataEntrada[i] = dataEntrada[i+1]
						dataEntrada[i+1] = ""
			
						nome[i] = nome[i+1]
						nome[i+1] = ""
			
						equipamento[i] = equipamento[i+1]
						equipamento[i+1] = ""
			
						problema[i] = problema[i+1]
						problema[i+1] = ""
					}

					menu()
					pare
				}

				caso '2':{
					menu()
					pare
				}

				caso contrario:{
					manutencao()
					pare
				}
			}
		}senao{
			escreva("Não existe equipamentos para concluir a manutenção!\n")
			
			retorna()
			menu()
		}
	}

	funcao filaAtendimento(){
		escreva("-----FILA DE ATENDIMENTO-----\n\n")
		
		se(equipamento[0] != ""){
			para(inteiro i = 0; i < total; i++){
				se(equipamento[i] != ""){
					escreva(equipamento[i], "\n")
				}
			}
		}senao{
			escreva("Não existe equipamentos na fila de atendimento!\n")
		}

		retorna()
		menu()
	}

	funcao consultaAtendimento(){
		escreva("-----PRÓXIMO EQUIPAMENTO A SER ATENDIDO-----\n\n")

		se(equipamento[0] != ""){
			escreva("Data de entrada: ", dataEntrada[0], "\n")
			escreva("Nome do proprietário: ", nome[0], "\n")
			escreva("Equipamento: ", equipamento[0], "\n")
			escreva("Problema: ", problema[0], "\n")
		}senao{
			escreva("Não existe equipamentos na fila de atendimento!\n")
		}

		retorna()
		menu()	
	}

	funcao buscaEquipamento(){
		cadeia equipamentoT
		logico encontrado = falso
		
		escreva("-----BUSCAR EQUIPAMENTO-----\n\n")
		escreva("Equipamento: ")
		leia(equipamentoT)
		equipamentoT = T.caixa_alta(equipamentoT)

		para(inteiro i = 0; i < total; i++){
			se(equipamento[i] == equipamentoT){
				escreva("\nPosição na fila: ", i+1, "\n")
				escreva("Data de entrada: ", dataEntrada[i], "\n")
				escreva("Nome do proprietário: ", nome[i], "\n")
				escreva("Equipamento: ", equipamento[i], "\n")
				escreva("Problema: ", problema[i], "\n")
				encontrado = verdadeiro
			}
		}

		se(encontrado == falso){
			escreva("\nNão foi encontrado este equipamento!\n")
		}

		retorna()
		menu()		
	}

	funcao statusFila(){
		inteiro onFila = 0 
		inteiro onAtendidos = 0
		
		escreva("-----STATUS DA FILA-----\n\n")

		para(inteiro i = 0; i < total; i++){
			se(equipamento[i] != ""){
				onFila++
			}

			se(equipamentoCon[i] != ""){
				onAtendidos++
			}
		}

		escreva("Equipamentos a serem atendidos: ", onFila, "\n")
		escreva("Equipamentos atendidos: ", onAtendidos, "\n")

		retorna()
		menu()
	}

	funcao equipamentosConsertados(){
		real totalManutencao = 0.0
		
		escreva("-----EQUIPAMENTOS CONSERTADOS-----\n\n")

		para(inteiro i = 0; i < total; i++){
			se(equipamentoCon[i] != ""){
				escreva(equipamentoCon[i], " | Valor: ", valorManutencao[i], "\n")
				totalManutencao += valorManutencao[i]
			}
		}

		escreva("\nValor total das manutenções: R$", totalManutencao, "\n")

		retorna()
		menu()
	}

	funcao buscaEquipamentosConsertados(){
		cadeia equipamentoT
		logico encontrado = falso
		
		escreva("-----BUSCAR EQUIPAMENTO-----\n\n")
		escreva("Equipamento: ")
		leia(equipamentoT)
		equipamentoT = T.caixa_alta(equipamentoT)

		para(inteiro i = 0; i < total; i++){
			se(equipamentoCon[i] == equipamentoT){
				escreva("\n", equipamentoCon[i], " Valor: R$", valorManutencao[i], "\n")
				encontrado = verdadeiro
			}
		}

		se(encontrado == falso){
			escreva("\nNão foi encontrado este equipamento!\n")
		}

		retorna()
		menu()
	}

	funcao sair(){
		inteiro i = 0

		enquanto(i < 3){
			escreva("Saindo do sistema.")
			U.aguarde(500)
			limpa()
			escreva("Saindo do sistema..")
			U.aguarde(500)
			limpa()
			escreva("Saindo do sistema...")
			U.aguarde(500)
			limpa()
			i++
		}

		escreva("Sistema finalizado.")
	}

	funcao retorna(){
		cadeia r
		escreva("\nAperte ENTER para voltar ao menu")
		leia(r)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5091; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {dataEntrada, 7, 8, 11}-{equipamento, 7, 41, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */