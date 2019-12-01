# rei-do-almoco
O rei do almoço é um app que proclamará o rei mais amado ou odiado pelos seus súditos.

# como configurar aplicação

### configurando banco de dados
  * rodar script sql que esta na pasta docs

### configurando API
Configurar as chaves de conexão com banco de dados e período de validade das eleições do rei:
  * "ConnectionString" : string de conexão com banco de dados SQL Server.
  * "PeriodoDeVotacao:Inicio" : hora e minuto do início da votação ex: 10:00
  * "PeriodoDeVotacao:Fim" : hora e minuto do fim da votação ex: 12:00


### configurando Site
Configurar chave de da URL para comunicação com API
  * "UrlApi" : Url para comunicar com API
