## PDS - Fokko App

### 1. Visão Geral do Produto
**Nome**: Fokko
**Descrição**: Aplicativo de produtividade baseado na técnica Pomodoro. Permite ao usuário realizar sessões de foco e pausas alternadas, promovendo concentração e controle de tempo.
**Público-alvo**: Profissionais, estudantes e qualquer pessoa que deseje gerenciar melhor o tempo e manter o foco em tarefas.

### 2. Objetivo do Produto
O Fokko tem como objetivo:
 - Auxiliar o usuário a manter a disciplina em ciclos de trabalho
 - Reduzir distrações através de um sistema  simples e intuitivo
 - Permitir o acompanhamento da evolução através de um histórico local

### 3. Funcionalidades do MVP
#### 3.1 - Timer de foco
- Inicia sessão de 25 minutos
- Possibilidade de pausar, continuar e resetar o temporizador
- Alerta visual ou sonoro ao final
#### 3.2 - Alternância entre Modos
* Modos disponíveis
	* Foco (25 minutos)
	* Pausa Curta (5 minutos)
	* Pausa Longa (15 minutos)
* O modo pode ser alternado manualmente
#### 3.3 - Histórico Local
- Registro de sessões concluídas (data e tipo)
- Armazenamento local (banco ou SharedPreferences)
- Tela de listagem simples com os registros

### 4. Tecnologias e Abordagem Arquitetural
- **Framework**: Flutter
-  **Gerenciamento de estado**: Command Pattern + MVVM
-  **Persistência local**: Banco de dados ou SharedPreferences
-  **Arquitetura**: 
	- Models -> Viewmodels -> Views
	- Commands para isolar ações (ex: iniciar timer, salvar sessão)
	- Services para infraestrutura (temporizador, armazenamento)

### 5. Restrições Técnicas
- O aplicativo não terá backend (100% offline)
- Nenhum sistema de login/autenticação será implementado no MVP
- Aplicativo focado para smartphones (sem suporte a tablets no MVP)

### 6. Planejamento Futuro
- Personalização dos tempos de foco e pausas
- Gráficos com estatísticas semanais/mensais
- Notificação agendadas e lembretes
- Backup na nuvem
- Widgets de acesso rápido

### 7. Métricas de Sucesso
- Conclusão de sessões por dia/semana
- Redução no abandono de sessões
- Retorno do usuário ao app em diferetes dias (retenção)
- Simplicidade e fluidez da UI (zero bugs/blockers)
