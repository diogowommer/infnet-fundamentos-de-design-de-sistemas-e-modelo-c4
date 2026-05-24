# ADR 003 — Utilizar Eventos de Domínio para Desacoplamento

## Status
Aceito

## Contexto
Algumas operações secundárias do sistema, como envio de notificações e auditoria, não devem impactar diretamente o fluxo principal de agendamento.

Além disso, a arquitetura deve permitir evolução futura para comunicação distribuída.

## Decisão
Utilizar eventos de domínio para comunicação assíncrona entre módulos internos.

Exemplo:
- ConsultaAgendada
- ConsultaCancelada
- PacienteCadastrado

## Alternativas Consideradas

### Comunicação Síncrona Direta
Mais simples de implementar, porém aumenta acoplamento entre módulos.

### Orquestração Centralizada
Centraliza fluxos, mas aumenta dependência entre componentes e reduz flexibilidade.

## Trade-offs, Riscos e Impactos
Eventos reduzem acoplamento e melhoram escalabilidade interna.

Como trade-off, aumentam complexidade de rastreamento e observabilidade.

A decisão também prepara a arquitetura para possível evolução futura para microsserviços.