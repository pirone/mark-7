#language: pt

Funcionalidade: Cadastro de tarefas
    Para que eu possa organizar minha vida
    Sendo um usuário cadastrado
    Posso adicionar novas tarefas no meu Painel

    @login @logout
    Cenario: Nova Tarefa
        
        Dado que o nome da minha tarefa é "Planejar minha viagem para Amsterdam"
        E a data de finalização será "20/08/2018"
        E quero taguear esta tarefa com:
            | tag         |
            | Eurotrip    |
            | Ficar louco |
            | Insanidade  |
        Quando faço o cadastro desta tarefa
        Então devo ver esta tarefa com o status "Em andamento"
        E devo ver somente 1 tarefa com o nome cadastrado

    @tentativa @login @logout
    Esquema do Cenario: Tentar cadastrar

        Dado que o nome da minha tarefa é "<nome>"
        E a data de finalização será "<data>"
        Quando faço o cadastro desta tarefa
        Então devo ver a seguinte mensagem "<mensagem>"

        Exemplos: 
            | nome | data       | mensagem                            |
            | Ler  | 21/08/2018 | 10 caracteres é o mínimo permitido. |
            |      | 21/08/2018 | Nome é obrigatório.                 |
        
    @login @logout @dup
    Cenario: Tarefa não pode ser duplicada

        Dado que o nome da minha tarefa é "Ler o blog do Papito"
        E a data de finalização será "22/08/2018"
        Mas eu já cadastrei esta tarefa e esqueci
        Quando faço o cadastro desta tarefa
        Então devo ver a seguinte mensagem "Tarefa duplicada."
        E devo ver somente 1 tarefa com o nome cadastrado
