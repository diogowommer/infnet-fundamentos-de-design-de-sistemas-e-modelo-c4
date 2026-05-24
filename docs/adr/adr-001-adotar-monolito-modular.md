# ADR 001 — Adotar Monolito Modular

## Status
Aceito

## Contexto
A plataforma de agendamento médico precisa suportar evolução contínua, baixo acoplamento e facilidade de manutenção, sem aumentar excessivamente a complexidade operacional do ambiente.

O sistema será inicialmente desenvolvido e operado por um time reduzido ou médio, tornando importante a escolha de uma arquitetura simples de implantar, monitorar e evoluir.

## Decisão
Adotar uma arquitetura baseada em Monólito Modular, organizada por domínios de negócio independentes.

Os módulos serão separados por responsabilidades, como:
- Agenda
- Pacientes
- Profissionais
- Notificações
- Administração

## Alternativas Consideradas

### Microsserviços
Oferecem maior independência de deploy e escalabilidade granular, porém aumentam significativamente a complexidade operacional, monitoramento distribuído e custo de infraestrutura.

### Monolito Tradicional
Possui menor complexidade estrutural inicial, mas aumenta o acoplamento interno e dificulta manutenção e evolução futura.

## Trade-offs, Riscos e Impactos
A solução reduz complexidade operacional e melhora produtividade do time.

Como trade-off, perde parte da independência de deploy oferecida por microsserviços.

A modularidade, entretanto, permite futura extração gradual de módulos para microsserviços caso o crescimento do sistema justifique.