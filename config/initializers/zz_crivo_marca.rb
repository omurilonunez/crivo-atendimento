# Marca da Crivo: troca o nome "Chatwoot" por "Crivo" na instalação.
# O nome fica guardado no banco (InstallationConfig). Numa instalação nova o padrão já é "Crivo"
# (config/installation_config.yml); numa que já existia, este arquivo corrige ao subir o servidor.
# Só roda no servidor web (rails s), nunca no build da imagem nem no Sidekiq.
Rails.application.config.after_initialize do
  next unless defined?(Rails::Server)

  %w[INSTALLATION_NAME BRAND_NAME].each do |chave|
    config = InstallationConfig.find_by(name: chave)
    next if config.nil? || config.value != 'Chatwoot'

    config.update!(value: 'Crivo')
  end
rescue StandardError => e
  Rails.logger.warn("[crivo] marca não aplicada: #{e.message}")
end
