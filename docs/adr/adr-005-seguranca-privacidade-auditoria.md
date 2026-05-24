# ADR 005 — Estratégia de Segurança, Privacidade e Auditoria

## Status
Aceito

## Contexto
A plataforma manipula dados pessoais e informações sensíveis relacionadas à saúde dos pacientes, exigindo mecanismos de proteção, rastreabilidade e controle de acesso.

Além disso, o sistema deve reduzir riscos de acesso indevido, vazamento de informações e alterações não auditáveis.

## Decisão
Adotar uma estratégia de segurança baseada em:
- Autenticação centralizada
- Controle de acesso por perfil
- Criptografia de dados sensíveis
- Registro de auditoria para operações críticas

As operações relevantes, como agendamentos, cancelamentos e acessos administrativos, serão registradas para rastreabilidade.

## Alternativas Consideradas

### Controle de acesso simplificado
Possui implementação mais rápida, porém reduz segurança e granularidade de permissões.

### Auditoria apenas por logs técnicos
Facilita implementação inicial, mas dificulta rastreamento funcional e análise de incidentes.

## Trade-offs, Riscos e Impactos
A estratégia aumenta segurança, governança e rastreabilidade da plataforma.

Como trade-off, adiciona maior complexidade de implementação e processamento adicional em operações críticas.

A decisão reduz riscos relacionados à exposição indevida de dados e melhora capacidade de investigação de incidentes e conformidade regulatória.