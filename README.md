# 🧪 Testes Automatizados de Monitoração de Ambientes — Funcional Health Tech

Este repositório contém uma suíte de testes automatizados desenvolvida em **Robot Framework** para validar o funcionamento dos sistemas internos e portais da **Funcional Health Tech**, com foco em **autorizadores**, **portais corporativos** e **integrações web**.

O objetivo é permitir que **monitores da equipe** executem testes complexos de forma **simples, rápida e segura**, sem precisar alterar código.

---

## 🚀 Objetivo do Projeto

Esses testes automatizados foram criados para:

* Garantir a **disponibilidade e estabilidade** de sistemas essenciais (autorizadores, portais, integrações).
* Verificar **fluxos críticos**, como login, geração de token JWT, validação de páginas e consultas de sistemas.
* Simplificar a rotina dos monitores, permitindo **execução via cliques** em arquivos `.bat`.
* Manter **segurança e privacidade**, evitando exposição de dados sensíveis no repositório público.

---

## ⚙️ Configuração Inicial

1. **Instalar dependências**

   Certifique-se de ter o **Python** instalado e, em seguida, execute:

   ```bash
   pip install robotframework selenium
   ```

2. **Solicitar os arquivos de ambiente**

   Os arquivos `env/*.robot` contêm variáveis sensíveis (login, senha, tokens) e **não são versionados**.
   Solicite-os diretamente com **Kaique Nascimento de Oliveira** para ter acesso completo às execuções.

3. **(Opcional)** Instalar o **Windows Terminal**

   Para exibir emojis (✅ ❌) corretamente no console, instale o *Windows Terminal* pela Microsoft Store.
   Caso não esteja instalado, os testes funcionarão normalmente — apenas sem ícones gráficos.

---

## 💬 Para os Monitores

Os testes podem ser executados em **dois modos**:

### ▶️ Modo UI

* Exibe o navegador em tempo real, permitindo acompanhar a execução passo a passo.

### 🕶️ Modo Headless

* Executa em segundo plano, sem abrir o navegador (ideal para multitarefas).

Para executar, **basta dar duplo clique** no arquivo `.bat` desejado:

* `ui-test.bat` → executa todos os testes com interface.
* `headless-test.bat` → executa todos os testes em segundo plano.
* Também é possível executar **testes individuais** (UI ou Headless) diretamente nos arquivos dentro das pastas de testes ou pela pasta `testes/` (onde há atalhos prontos para cada teste).

Durante a execução, o terminal mostrará:

```
✅ Indica sucesso (ex: ✅ https://funcionalhealthtech.com.br/ Login bem sucedido)
❌ Indica falha (ex: ❌ https://funcionalhealthtech.com.br/ Erro ao logar)
❗ Indica o motivo da falha (ex: ❗ Falha ao clicar em botão "Login")
```

---

## 🛡️ Segurança e Privacidade

* Nenhum log de execução é salvo (`output.xml`, `log.html`, `report.html` estão desativados).
* As credenciais permanecem **somente em arquivos locais** (`env/*.robot`).
* Os monitores **não precisam alterar variáveis ou código** — tudo é automatizado via scripts `.bat`.

---

## 👨‍💻 Autor

**Kaique Nascimento de Oliveira**
Aprendiz de tecnologia com foco em desenvolvimento e automação de testes.
Atualmente atuando na área de **Monitoria e Operações** na **Funcional Health Tech**.

---

## 📂 Estrutura (visão geral)

O repositório está organizado de forma a separar testes, recursos e variáveis:

```
📦 ROBOT/
 ┣ 📂 2 Portais e Sistemas Gestores/    # Pasta de testes para sistema especificado
 ┣ 📂 3 Autorizadores/
 ┣ 📂 8 Acesso ao Funcionalplant/
 ┣ 📂 10 Cadastro de Programas/
 ┣ 📂 11 Webview/
 ┣ 📂 env/              # Variáveis locais (não versionadas)
 ┣ 📂 Testes - Atalhos/             # Atalhos para testes individuais
 ┣ 📜 geral-resource.robot          # Variáveis gerais
 ┣ 📜 ui-test.bat                   # Executável de Testes UI
 ┣ 📜 headless-test.bat             # Executável de Testes Headless
 ┣ 📜 README.md
```

---

## 🧭 Fluxo de Uso

1. Solicite os arquivos `env` corretos.
2. Escolha o modo de execução (`ui-test.bat` ou `headless-test.bat`).
3. Aguarde o resultado no terminal.
4. Consulte os logs visuais no próprio console.

---

## 🧩 Tecnologias Utilizadas

* **Robot Framework**
* **SeleniumLibrary**
* **Python**
* **Batch Scripts (.bat)**
* **Windows Terminal**

---