workspace "Plataforma de Agendamento Médico" "Arquitetura C4 da Plataforma de Agendamento Médico" {

    !identifiers hierarchical

    model {
        paciente = person "Paciente" "Pessoa que pesquisa profissionais, visualiza horários disponíveis e agenda consultas online."
        profissional = person "Profissional de Saúde" "Médico ou especialista que disponibiliza horários e acompanha consultas agendadas."
        administrador = person "Administrador da Clínica" "Responsável por gerenciar profissionais, agendas e regras operacionais da clínica."

        plataforma = softwareSystem "Plataforma de Agendamento Médico" "Sistema responsável por centralizar o agendamento online de consultas médicas." {
            webApp = container "Aplicação Web/Mobile" "Interface utilizada por pacientes, profissionais e administradores." "React / Mobile App"

            api = container "API da Plataforma" "Expõe os casos de uso da plataforma e coordena as regras de aplicação." "REST API"

            database = container "Banco de Dados Relacional" "Armazena pacientes, profissionais, agendas, consultas, permissões e registros de auditoria." "PostgreSQL" {
                tags "Database"
            }

            internalEvents = container "Sistema de Eventos Internos" "Responsável pela comunicação assíncrona entre módulos da plataforma." "Eventos Internos"

            worker = container "Worker de Notificações" "Processa eventos assíncronos e envia lembretes, confirmações e avisos." "Background Worker"
        }

        notificacoes = softwareSystem "Serviço de Notificações" "Serviço externo para envio de e-mail, SMS ou WhatsApp." {
            tags "External System"
        }

        pagamento = softwareSystem "Gateway de Pagamento" "Sistema externo responsável pelo processamento de pagamentos de consultas." {
            tags "External System"
        }

        teleconsulta = softwareSystem "Plataforma de Teleconsulta" "Sistema externo utilizado para criação e acesso a consultas online." {
            tags "External System"
        }

        paciente -> plataforma.webApp "Acessa para pesquisar e agendar consultas"
        profissional -> plataforma.webApp "Gerencia disponibilidade e acompanha consultas"
        administrador -> plataforma.webApp "Administra clínicas, profissionais e agendas"

        plataforma.webApp -> plataforma.api "Consome APIs HTTPS/JSON"
        plataforma.api -> plataforma.database "Lê e grava dados"
        plataforma.api -> plataforma.internalEvents "Publica eventos internos"
        plataforma.worker -> plataforma.internalEvents "Consome eventos internos"
        plataforma.worker -> notificacoes "Envia mensagens de confirmação e lembrete"

        plataforma.api -> pagamento "Solicita processamento de pagamento"
        plataforma.api -> teleconsulta "Cria ou consulta links de teleatendimento"
    }

    views {
        container plataforma "C2_Conteineres" {
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