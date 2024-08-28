# Arquitetura

Foi utilizado o padrão VIP (View / Interactor / Presenter) para a construção das telas pois o mesmo é um padrão bastante robusto e escalável, não tendo nenhuma justificativa mais forte para a escolha do mesmo. Poderia ter sido utilizado um MVVM-C também, pois possuí a mesma maleabilidade que o VIP e em questões de curva de aprendizagem é até mais simples no que tange adaptação ao modelo vindo por exemplo de um MVC.

Pensando em nível de modularização foi criado um `group` chamado `Core`, onde o mesmo abriga várias classes, extensions e protocolos afim de centralizar e evitar a duplicata de código. Dentro deste group podemos encontrar:

- Networking
    Contém a abstração para requisições RestFull e um protocolo que define o modelo para as requests, dessa forma, cria-se um padrão para construção das chamadas e consegue-se ajustar qualquer necessidade de forma bem rápida e simples. Podendo inclusive injetar configurações, como por exemplo, uma URL base para as requisições por variáveis de ambiente em uma CI ou algum outro mecanismode injeção.
- Commons
    Possuí alguns auxiliares para facilitar a codificação, como um helper para a utilização de um `fatalError` em modelo Thread Safe, o que possibilita inclusive a construção de testes unitários para um cenário de exceção se necessário. Como por exemplo, não encontrar uma dependencia registrada em um container de dependências por exemplo.
    Ainda é possível encontrar um protocolo para gestão de `Localizables` dessa forma, é possível segregar a nível de feature/módulo o gerenciamento das `strings` não sendo necessário utiliza-las hardcode.

Sem contar que este `group` pode ser migrado facilmente para um SPM ou um framework, ou qualquer outra estratégia a nível de segragação de código, possibilitando assim a reutilização dos mesmos em outros módulos e/ou projetos.


Pensando a nível de manutenabilidade de código, afim de evitar conflitos e merges "indevidos" no arquivo `.pbxproj`, pois sabemos que ele é um grande ofensor de tempo em projetos grandes com muitos desenvolvedores trabalhando, optei por utilizar o `Xcodegen` para gerenciar a criação do projeto do Xcode, deixando assim essa tarefa "dolorosa" mais simples e tornando a integração bem mais prática.

Ainda a nível de qualidade de código, foi utilizado o `Swiftlint` para manter padrão de código, como nomenclatura de variáveis, espaços ao final de arquivos, utilização de `weak` para variáveis delegates, entre outros.

# Libs

Optei por não utilizar nenhuma lib de terceiros para o challenge, entretanto, nada impediria de utilizar por exemplo, um Swinject para injeção de dependências, ou um Kingfisher para download de imagens. Como a proposta aqui era um "Sample" resolvi desenvolver tudo de forma 100% nativa.

# Testes

Foram construídos testes unitários para as features e códigos comuns usando o framework `XCTest` fornecido juntamente com o Xcode. Criei um módulo para os testes de UI, entretanto, não tive tempo hábil para construção dos mesmos.

# Como executar

Para automatizar e facilitar o processo de geração do projeto, construí um `Makefile` para a execução e configuração do ambiente para rodar o projeto.

Abaixo descrevo os passos necessários para rodar com sucesso o projeto. Para tanto, é recomendável que se esteja no terminal dentro da pasta raiz do projeto e execute a seguinte sequência de comandos.

- `make setup_environment` este comando irá preparar o ambiente necessário para a construção do projeto
    Basicamente ele irá executar e instalar os seguintes items:
        - Instalação do `Homebrew`
        - Instalação do `Swiftlint`
        - Instalação do `Xcodegen`
        - Instalação da Gem `Xcodeproj`
    Caso já possua todos os ítens deste passo pode-se ignora-lo e seguir para o próximo.

- `make config_scripts_permissions` este comando irá conceder permissão de execução para os scripts na pasta `scripts`
    Existem 2 scripts dentro da pasta `scripts`que são:
        - `postgen.sh` este comando irá executar o próximo script
        - `xcodeversion.rb` este script utiliza-se da gem `xcodeproj` para ler um arquivo chamado `version` na raiz do projeto
            onde este arquivo armazena em 2 linhas a version number e a compilation number para serem adicionados ao xcodeproj.
            Este script utiliza a gem para editiar o arquivo que será gerado pelo `Xcodegen` permitindo assim, uma fácil gestão
            das versões até mesmo por uma CI.

- `make setup_swiftlint_template` este comando irá copiar da pasta de templates o arquivo de configuração do swiftlint
    Este comando pode ser executado separadamente, entretanto, não há esta necessidade, pois o próximo passo já faz a chamada a ele

- `make project` este comando aciona o `Xcodegen` para criar o projeto do Xcode a partir do arquivo descrito `project.yml`
    Com este descritor, é possível configurar vários targets/schemes/variáveis de ambiente, entre outros, para serem gerenciados por ele, deixando mais fácil e simples a gestão das configurações de "baixo nível" do projeto. Sem contar, que é possível injetar as informações por variáveis de ambiente de CI, trazendo-as de um `Vault` ou qualquer outro mecanismo de gerenciamento de dados sensíveis. Para exemplificar seu dinamismo, configurei no challenge 3 flavors, simulando um ambiente produtivo, para dev, stage, prod.

Após a execução do último comando, será gerado na pasta raiz o arquivo .xcodeproj, bastando abri-lo e roda-lo.

# Observações

Notei alguns "problemas" durante o desenvolvimento do challenge e resolvi documenta-los para deixar claro, que talvez o "não-cumprimento" de algum requisito se deu por estes motivos e nenhum outro.

- URL do item `Level Up` do carrossel de produtos esta retornando `Access Denied` mesmo pegando a URL e abrindo-a em um browser
- Imagem do avatar da home tem um "logo" da Digio, entretanto, este asset não foi fornecido, dessa forma, utilizei um placeholder padrão para representa-lo, assim, como para as imagens que são carregadas, utilizei um placeholder para em caso de falha do loading, não ficar um "espaço em branco" para o usuário.
- Assim como o ícone, não foi fornecido as fontes, dessa forma, utilizei as fontes do iOS padrão.
- A título de sugestão, seria interessante disponbilizar um Figma/Zeplin/FigJam/PDF com as especificações de tamanho e distância dos elementos para a construção da home, dessa forma, seria mais fácil de reproduzir em sua integralidade o protótipo pedido. No caso, fui mais no olhometro para achar as medidas próximas do resultado final.

Possuo também um código contemplando todos os conhecimentos que tenho em Swift e outras ferramentas que fiz a algum tempo, se for de interesse podem encontra-lo aqui: https://www.github.com/maclacerda  no repositório `alter-solutions-challenge`