configuração inicial-
ORGANIZAR PASTAS NO GITHUB-
-repositório para o back-end.
-repositorio para o front-end.
-repositorio para o mysql.

FERRAMENTAS UTILIZADAS-
webstorm: IDE para fazer os codigos back-end e front end.
datagrip: IDE para o desenvolvimento do banco de dados.
github: versionamento de código.
copilot: IA principal utilizada no projeto.

TECNOLOGIAS UTILIZADAS-
mysql: banco de dados
dart x flutter: front-end
dart x frog: back-end

ESTRUTURA UI DE PASTAS-
Foi feito uma organização de pastas-
BIN - main.dart: foi o ponto de entrada, monta as rotas do codigo

LIB - guarda dentro dela as seguintes pastas:

MODELS-
user.dart: cria o formulario do usuario que vai retornar em JSON para o front-end
reciclavel.dart: define a estrutura de um material reciclavel, representa cada registro da tabela "reciclavel", no banco de dados

ROUTES-
users.dart: esse endpoint consulta o banco e transforma dados em objetos e retorna em JSON
reciclometro.dart:criação de endpoints para listar e cadastrar materias reciclaveis
reports.dart: criação de relatorio simples, por exemplo: total reciclado por tipo, essa rota retorna um resumo por tipo de material reciclavel

SERVICES-
db_service.dart: conexão com o banco de dados
 






