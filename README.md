# 🦊 Fokko App

Fokko é um aplicativo de produtividade inspirado na técnica Pomodoro. Desenvolvido com Flutter, ele ajuda usuários a manterem o foco em tarefas por meio de ciclos de trabalho e descanso, com uma interface simples e intuitiva.

## 📲 Visão Geral

- **Nome**: Fokko
- **Descrição**: Temporizador de foco com modos alternáveis e histórico local.
- **Público-alvo**: Estudantes, profissionais e qualquer pessoa que deseje melhorar a gestão do tempo.

## 🚀 Funcionalidades do MVP

- ⏱️ **Timer de Foco**
  - Sessões de 25 minutos
  - Pausar, continuar e resetar
  - Alertas visuais/sonoros

- 🔄 **Alternância entre Modos**
  - Modo Foco (25min)
  - Pausa Curta (5min)
  - Pausa Longa (15min)
  - Alternância manual entre os modos

- 📊 **Histórico Local**
  - Registro das sessões realizadas (data e tipo)
  - Armazenamento local (SharedPreferences ou banco)
  - Tela de listagem simples

## 🛠️ Tecnologias Utilizadas

- **Flutter** para desenvolvimento multiplataforma
- **Arquitetura MVVM** com padrão **Command**
- **Persistência local** com SharedPreferences ou banco local
- **100% offline** (sem backend)

## 📐 Arquitetura

```bash
lib/
├── commands/ # Ações isoladas (start, pause, reset, save)
├── models/ # Modelos de dados
├── services/ # Temporizador, persistência local
├── viewmodels/ # Lógica de apresentação (MVVM)
├── views/ # Telas do app
└── main.dart # Entry point
```

## 📉 Restrições Técnicas

- Sem login/autenticação
- Apenas smartphones (sem suporte a tablets)
- Funcionalidades offline

## 🔮 Planejamento Futuro

- Customização de tempos de foco e pausas
- Gráficos com estatísticas semanais/mensais
- Notificações e lembretes
- Backup na nuvem
- Widgets de acesso rápido

## 📏 Métricas de Sucesso

- Sessões concluídas por dia/semana
- Redução no abandono de sessões
- Retenção de usuários
- Experiência fluida e sem bugs

## 👨‍💻 Desenvolvido por

Felipe Ferreira - [LinkedIn](https://www.linkedin.com/in/felipefsf)

---

> Projeto didático com fins de estudo e portfólio.
