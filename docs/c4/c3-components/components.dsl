workspace "Plataforma de Agendamento Médico" "Arquitetura C4 da Plataforma de Agendamento Médico" {

    !identifiers hierarchical

    model {
        paciente = person "Paciente" "Pessoa que pesquisa profissionais, visualiza horários disponíveis e agenda consultas online."
        profissional = person "Profissional de Saúde" "Médico ou especialista que disponibiliza horários e acompanha consultas agendadas."
        administrador = person "Administrador da Clínica" "Responsável por gerenciar profissionais, agendas e regras operacionais da clínica."

        plataforma = softwareSystem "Plataforma de Agendamento Médico" "Sistema responsável por centralizar o agendamento online de consultas médicas." {
            webApp = container "Aplicação Web/Mobile" "Interface utilizada por pacientes, profissionais e administradores." "React / Mobile App"

            api = container "API da Plataforma" "Expõe os casos de uso da plataforma e coordena as regras de aplicação." "REST API" {
                authController = component "Controlador de Autenticação" "Recebe requisições de login, cadastro e validação de sessão." "REST Controller"
                agendamentoController = component "Controlador de Agendamentos" "Recebe requisições para busca de horários, criação e cancelamento de consultas." "REST Controller"
                profissionalController = component "Controlador de Profissionais" "Gerencia dados de profissionais, especialidades e disponibilidade." "REST Controller"
                pacienteController = component "Controlador de Pacientes" "Gerencia cadastro e dados dos pacientes." "REST Controller"

                agendamentoService = component "Serviço de Agendamento" "Coordena os casos de uso relacionados à criação, cancelamento e confirmação de consultas." "Application Service"
                disponibilidadeService = component "Serviço de Disponibilidade" "Calcula horários disponíveis e aplica regras de agenda." "Application Service"
                segurancaService = component "Serviço de Segurança" "Aplica autenticação, autorização e validação de permissões." "Application Service"

                agendaDomain = component "Módulo de Domínio de Agenda" "Contém regras de negócio para agenda, disponibilidade e conflitos de horário." "Domain Module"
                pacienteDomain = component "Módulo de Domínio de Pacientes" "Contém regras de negócio relacionadas ao paciente." "Domain Module"
                profissionalDomain = component "Módulo de Domínio de Profissionais" "Contém regras de negócio relacionadas aos profissionais de saúde." "Domain Module"

                repository = component "Repositórios" "Abstraem acesso aos dados da plataforma." "Repository"
                eventPublisher = component "Publicador de Eventos Internos" "Publica eventos internos, como ConsultaAgendada e ConsultaCancelada." "Event Publisher"
            }

            database = container "Banco de Dados Relacional" "Armazena pacientes, profissionais, agendas, consultas, permissões e registros de auditoria." "PostgreSQL" {
                tags "Database"
            }

            internalEvents = container "Sistema de Eventos Internos" "Responsável pela comunicação assíncrona entre módulos da plataforma." "Eventos Internos"

            worker = container "Worker de Notificações" "Processa eventos assíncronos e envia lembretes, confirmações e avisos." "Background Worker"
        }

        notificacoes = softwareSystem "Serviço de Notificações" "Serviço externo para envio de e-mail, SMS ou WhatsApp." {
            tags "External System"
        }

        plataforma.webApp -> plataforma.api.authController "Realiza autenticação"
        plataforma.webApp -> plataforma.api.agendamentoController "Busca horários e agenda consultas"
        plataforma.webApp -> plataforma.api.profissionalController "Gerencia profissionais e disponibilidade"
        plataforma.webApp -> plataforma.api.pacienteController "Gerencia dados de pacientes"

        plataforma.api.authController -> plataforma.api.segurancaService "Valida credenciais e permissões"
        plataforma.api.agendamentoController -> plataforma.api.agendamentoService "Executa casos de uso de agendamento"
        plataforma.api.profissionalController -> plataforma.api.disponibilidadeService "Atualiza disponibilidade"
        plataforma.api.pacienteController -> plataforma.api.pacienteDomain "Aplica regras de cadastro"

        plataforma.api.agendamentoService -> plataforma.api.agendaDomain "Aplica regras de agenda"
        plataforma.api.agendamentoService -> plataforma.api.disponibilidadeService "Consulta horários disponíveis"
        plataforma.api.agendamentoService -> plataforma.api.eventPublisher "Publica eventos de consulta"
        plataforma.api.disponibilidadeService -> plataforma.api.profissionalDomain "Consulta regras de disponibilidade"
        plataforma.api.segurancaService -> plataforma.api.repository "Consulta usuários e permissões"

        plataforma.api.agendaDomain -> plataforma.api.repository "Usa abstrações de persistência"
        plataforma.api.pacienteDomain -> plataforma.api.repository "Usa abstrações de persistência"
        plataforma.api.profissionalDomain -> plataforma.api.repository "Usa abstrações de persistência"

        plataforma.api.repository -> plataforma.database "Lê e grava dados"
        plataforma.api.eventPublisher -> plataforma.internalEvents "Publica eventos internos"
        plataforma.worker -> plataforma.internalEvents "Consome eventos internos"
        plataforma.worker -> notificacoes "Envia notificações"
    }

    views {
        component plataforma.api "C3_Componentes_API" {
            include *
            autolayout lr
        }

        styles {
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }

            element "Software System" {
                shape roundedbox
                background #1168bd
                color #ffffff
            }

            element "Container" {
                shape roundedbox
                background #438dd5
                color #ffffff
            }

            element "Component" {
                shape roundedbox
                background #85bbf0
                color #000000
            }

            element "Database" {
                shape cylinder
                background #438dd5
                color #ffffff
            }

            element "External System" {
                shape roundedbox
                background #999999
                color #ffffff
            }

            relationship "Relationship" {
                thickness 3
                color #707070
            }
        }
    }

    configuration {
        scope softwaresystem
    }
}