workspace "Plataforma de Agendamento Médico" "Arquitetura C4 da Plataforma de Agendamento Médico" {

    !identifiers hierarchical

    model {
        paciente = person "Paciente" "Pessoa que pesquisa profissionais, visualiza horários disponíveis e agenda consultas online."
        profissional = person "Profissional de Saúde" "Médico ou especialista que disponibiliza horários e acompanha consultas agendadas."
        administrador = person "Administrador da Clínica" "Responsável por gerenciar profissionais, agendas e regras operacionais da clínica."

        plataforma = softwareSystem "Plataforma de Agendamento Médico" "Sistema responsável por centralizar o agendamento online de consultas médicas." {
        }

        notificacoes = softwareSystem "Serviço de Notificações" "Serviço externo para envio de confirmações, lembretes e avisos por e-mail, SMS ou WhatsApp." {
            tags "External System"
        }

        pagamento = softwareSystem "Gateway de Pagamento" "Sistema externo responsável pelo processamento de pagamentos de consultas." {
            tags "External System"
        }

        teleconsulta = softwareSystem "Plataforma de Teleconsulta" "Sistema externo utilizado para criação e acesso a consultas online." {
            tags "External System"
        }

        paciente -> plataforma "Pesquisa profissionais, visualiza horários e agenda consultas"
        profissional -> plataforma "Gerencia disponibilidade e acompanha consultas"
        administrador -> plataforma "Administra clínicas, profissionais e agendas"

        plataforma -> notificacoes "Envia confirmações, lembretes e avisos"
        plataforma -> pagamento "Solicita processamento de pagamento"
        plataforma -> teleconsulta "Cria ou consulta links de teleatendimento"
    }

    views {
        systemContext plataforma "C1_Contexto" {
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