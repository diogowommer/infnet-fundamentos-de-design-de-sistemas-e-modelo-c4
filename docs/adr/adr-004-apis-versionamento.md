# ADR 004 — Estratégia de APIs e Versionamento

## Status
Aceito

## Contexto
A plataforma precisará atender aplicações web, mobile e futuras integrações externas sem quebrar compatibilidade entre consumidores.

A evolução contínua das APIs exige uma estratégia clara de governança e versionamento.

## Decisão
Adotar APIs REST versionadas via URL.

Exemplo:
- /api/v1/pacientes
- /api/v1/agendamentos

Os contratos serão documentados e mantidos com compatibilidade retroativa controlada.

## Alternativas Consideradas

### APIs Sem Versionamento
Simplificam implementação inicial, porém aumentam risco de quebra entre consumidores.

### Versionamento por Header
Possui maior flexibilidade, mas reduz clareza e simplicidade operacional.

### GraphQL
Oferece flexibilidade de consumo, porém adiciona complexidade desnecessária para o contexto inicial do sistema.

## Trade-offs, Riscos e Impactos
O versionamento via URL simplifica entendimento e governança das integrações.

Como trade-off, pode aumentar manutenção de versões antigas da API.

A estratégia reduz riscos de incompatibilidade e facilita evolução gradual dos contratos de serviço.