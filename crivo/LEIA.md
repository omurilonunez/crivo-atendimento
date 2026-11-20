# Plataforma de atendimento da Crivo

Fork do Chatwoot v4.18.0 (a mesma versão da Conceito), branch `crivo`, repositório `omurilonunez/crivo-atendimento`. Plano e decisões no Claude Doc "Plataforma de atendimento da Crivo (fork do Chatwoot)".

## Regras
- Nada pesado roda no Mac do Murilo (8 GB de RAM). A imagem é montada no GitHub Actions (`.github/workflows/crivo-imagem.yml`) e publicada em `ghcr.io/omurilonunez/crivo-atendimento`; o servidor só baixa.
- Mexer só no front-end. Esconder, não apagar. Seção nova (CRM, equipe) em tela e rota próprias.
- Os workflows originais do Chatwoot foram tirados da branch `crivo` pra não rodarem no fork.

## Teste no servidor (desde 2026-11-20)
- EasyPanel, projeto `cpfchecker` (o plano gratuito só deixa 3 projetos), serviços `plataforma`, `plataforma-sidekiq`, `plataforma-db`, `plataforma-redis`, com limite de memória. Separado do `clientes`, onde está a Conceito.
- Endereço: https://plataforma.nlqn0m.easypanel.host

## O que já mudou
- Logo: `public/brand-assets/` com a bolinha da Crivo (`crivo/icone.svg`); no modo escuro, só o "C" (`crivo/icone-c.svg`).
- Favicons e ícones PNG: refeitos no build por `crivo/gerar-icones.sh`.
- Nome `Crivo`: padrão em `config/installation_config.yml` (instalação nova) e `config/initializers/zz_crivo_marca.rb` (corrige a que já existe ao subir). A tela de marca do Super Admin é recurso pago (pasta `enterprise/`) e não é destravada.
- A imagem é só Community (MIT): o build tira a pasta `enterprise/`, que tem licença paga.
