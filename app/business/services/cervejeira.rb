module Services
  class Cervejeira
    include HTTParty

    def initialize(overrides = {})
      @base_uri = 'http://localhost:3001'
      @headers = { 'Content-Type' => 'application/json',
                   'Accept' => 'application/json' }
    end

    def cervejas
      self.class.get("#{@base_uri}/api/v1/cervejas")
    end

    def cerveja(id)
      self.class.get("#{@base_uri}/api/v1/cervejas/#{id}")
    end

    def adicionar_cerveja(cerveja)
      self.class.post("#{@base_uri}/api/v1/cervejas", body: cerveja.to_json, headers: @headers)
    end

    def deletar_cerveja(id)
      self.class.delete("#{@base_uri}/api/v1/cervejas/#{id}")
    end

    def atualizar_cerveja(cerveja)
      self.class.put("#{@base_uri}/api/v1/cervejas/#{id}", body: cerveja)
    end

    def melhor_cerveja_por_temperatura(temperatura)
      self.class.get("#{@base_uri}/api/v1/cervejas/cerveja/#{temperatura}")
    end

  end
end
