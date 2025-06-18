# Plano de Execução Técnica - Fokka

### 1. Visão Geral

Este plano detalha as etapas de desenvolvimento técnico para a contrução do Fokka, com foco em clareza, modularidade e entrega rápida do MVP

---

### 2. Estrutura de Pastas Inicial

```bash
lib/
├── app.dart
├── main.dart
├── core/
│   └── utils/                  # Formatadores, helpers de tempo
├── models/                     # SessionModel, TimerMode, TimerState
├── viewmodels/                # TimerViewModel
├── commands/                  # StartTimerCommand, ResetCommand etc.
├── services/                  # TimerService, StorageService
├── storage/                   # Hive setup, adapters
├── ui/
│   ├── screens/               # HomeScreen, HistoryScreen
│   └── components/            # TimerDisplay, ModeSelector, Buttons
```
---

### 3. Etapas de Implementação
**Etapa 1: Setup do Projeto**
- Criar projeto Flutter
- Adicionar dependências

```yaml
dependencies:
  flutter:
  hive: ^...
  hive_flutter: ^...
  path_provider: ^...
```
- Inicializar o Hive no `main.dart`e registrar os adapters
---
**Etapa 2: Definir Models**
- `TimeMode`: enum (`focus`, `shortBreak`, `longBreak`)
- `TimerState`: modo atual, tempo restante, status (`running`, `paused`, `idle`)
---
**Etapa 3: Services**
- `TimeService`: encapsula `Timer.periodic`, permite iniciar, pausar, parar e callbacks de tick
- `StorageService`: wrapper sobre Hive para salvar/ler sessões
---
**Etapa 4: Commands**
- StartTimeCommand
- PauseTimeCommand
- ResetTimeCommand
- SaveSessionCommand
Cada comando recebe dependências no construtor e executa ações diretas sobre services ou ViewModel
---
**Etapa 5: ViewModel**
- `TimerViewModel`: usa `ValueNotifier` para tempo, modo atual, status
- Expõe métodos para chamar os comandos (ex: `start()`, `pause()`, `reset()`)
---
**Etapa 6: UI(View)**
- Tela principal com:
	- Display do timer
	- Botões de controle (start/pause/reset)
	- Seletor de modo
- Tela de histórico com listagem simples via ListView
---
**Etapa 7: Integração de Testes**
- Testar comportamento dos comandos isoladamente
- Testar lógica do `TimeService`
- Validar persistência no `StorageService`
---
**Etapa 8: Build Final e Ajustes**
- Ícone, splash screen, permissões mínimas
- Feedback visual ao fim do timer (animação ou alerta simples)
- Preparar Readme e screenshots
