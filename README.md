# 🏢 Consultar CNPJ – Projeto Delphi VCL

## 📖 Descrição

O **Consultar CNPJ** é um aplicativo desenvolvido em **Delphi (VCL)** que permite realizar consultas de informações de empresas a partir do **CNPJ**.
O sistema busca automaticamente os dados da empresa em fontes públicas disponíveis e exibe informações como **razão social**, **nome fantasia**, **endereço**, **situação cadastral**, entre outras.

O objetivo é oferecer uma ferramenta prática e rápida para verificar informações cadastrais de empresas brasileiras.

---

## ⚙️ Tecnologias Utilizadas

* **Delphi VCL** (Ambiente Desktop)
* **TNetHTTPClient / TIdHTTP** – para realizar requisições HTTP
* **JSON / REST** – para tratamento e exibição das informações
* **API pública de CNPJ** (pode ser adaptada para diferentes provedores)
* **Componentes visuais padrão do Delphi** (TEdit, TButton, TLabel, TMemo, etc.)

---

## 🚀 Como Executar

1. **Clone ou baixe o projeto**
   Baixe os arquivos fonte ou clone o repositório:

   ```bash
   git clone https://github.com/WolffAlc/ConsultarCNPJ
   ```

2. **Abra o projeto no Delphi**
   Abra o arquivo principal `.dproj` ou `.dpr` pelo **Delphi IDE**.

3. **Compile e execute o projeto**
   Pressione **F9** ou clique em **Run** para compilar e iniciar o aplicativo.

4. **Faça a consulta de CNPJ**

   * Digite um CNPJ válido no campo de entrada (exemplo: `27865757000102`).
   * Clique em **Consultar**.
   * Aguarde o retorno dos dados e visualize as informações completas na tela.

---

## 🧠 Funcionalidades Principais

✅ Consulta de CNPJ em tempo real
✅ Exibição completa das informações da empresa
✅ Validação automática do número de CNPJ
✅ Interface simples e intuitiva
✅ Suporte para diferentes APIs de consulta

---

## ⚠️ Observações

* É necessário acesso à internet para realizar a consulta.
* Caso utilize uma **API externa**, verifique se é necessário **token de autenticação**.
* O formato do retorno pode variar conforme o serviço utilizado.

---

## 📜 Licença

Este projeto é distribuído sob a licença **MIT**.
Você pode usar, modificar e distribuir o código livremente, desde que mantenha os créditos originais.

---

## 👨‍💻 Autor

**Wolfgang**
Desenvolvedor Delphi
💼 [GitHub](https://github.com/WolffAlc) • ✉️ Contato profissional (wolfgang.alexandre15@gmail.com)

---
