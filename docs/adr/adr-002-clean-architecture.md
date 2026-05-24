# ADR 002 — Utilizar Arquitetura em Camadas com Clean Architecture

## Status
Aceito

## Contexto
O sistema exige alta manutenibilidade, facilidade de testes e separação clara entre regras de negócio e detalhes de infraestrutura.

Também é necessário reduzir dependência direta de frameworks e tecnologias específicas.

## Decisão
Adotar Arquitetura em Camadas baseada nos princípios de Clean Architecture, separando:
- Interface
- Aplicação
- Domínio
- Infraestrutura

As regras de negócio permanecerão isoladas de detalhes externos, aumentando desacoplamento e facilidade de evolução.

## Alternativas Consideradas

### Arquitetura em Camadas Tradicional
Embora simples, tende a concentrar regras de negócio próximas da infraestrutura e do framework utilizado.

### Estrutura Orientada ao Framework
Aumenta velocidade inicial de desenvolvimento, porém gera forte dependência tecnológica e maior dificuldade de testes.

## Trade-offs, Riscos e Impactos
A abordagem adiciona maior estrutura inicial ao projeto e exige disciplina arquitetural do time.

Em compensação, reduz acoplamento, melhora testabilidade e facilita manutenção e evolução futura da plataforma.