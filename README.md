
# 🧪 Testes Automatizados de Monitoração de Ambientes — Funcional Health Tech

Este repositório contém uma suíte de **testes automatizados desenvolvida em Robot Framework** para validar o funcionamento dos sistemas internos e portais da **Funcional Health Tech**, com foco em **autorizadores**, **portais corporativos**, **cadastros** e **integrações web**.

O objetivo é permitir que **monitores da equipe** executem testes complexos de forma **simples, rápida e segura**, através de um **menu interativo em linha de comando** que facilita a seleção do tipo de execução e do sistema desejado.

---

## 🚀 Objetivo do Projeto

Esses testes automatizados foram criados para:

- Garantir a **disponibilidade e estabilidade** de sistemas essenciais (autorizadores, portais, integrações).
- Verificar **fluxos críticos**, como login, geração de token JWT, validação de páginas e consultas.
- Simplificar a rotina dos monitores, permitindo **execução via cliques** em scripts `.bat`.
- Manter **segurança e privacidade**, evitando exposição de dados sensíveis no repositório público.

---

## ⚙️ Configuração Inicial

### 1. Instalar dependências

**1.1.** Baixe e instale o Python:  
🔗 [https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)  
(Exemplo de instalador: `python-3.13.7-amd64.exe`)

Durante a instalação, **marque a opção “Add Python to PATH”**.

**1.2.** Após a instalação, abra o **Prompt de Comando (CMD)** e digite:
```bash
python --version
pip --version
```

Exemplo de saída esperada:

```
Python 3.13.7
pip 25.3 from C:\Users\...\Python313\Lib\site-packages\pip
```

**1.3.** Instale as dependências necessárias:

```bash
pip install robotframework selenium robotframework-seleniumlibrary webdriver-manager robotframework-pabot
```

**1.4.** Verifique se foram instaladas corretamente:

```bash
pip list
```

Procure pelos pacotes:

```
pip
robotframework
robotframework-pabot
robotframework-seleniumlibrary
selenium
webdriver-manager
```

---

### 2. Solicitar arquivos de ambiente

Os arquivos `env/*.robot` contêm **variáveis sensíveis** (logins, senhas, tokens) e **não são versionados**.
Solicite-os diretamente com **Kaique Nascimento de Oliveira** ou com o time de **Monitoria/Operações**.

---

### 3. (Opcional) Instalar o Windows Terminal

Para exibir emojis e cores corretamente, instale o **Windows Terminal** pela Microsoft Store.
Os testes funcionarão normalmente mesmo sem ele.

---

### 4. Baixar e extrair o repositório

Clique no botão "**<> Code ▾**" em verde no repositório acima. Em seguida, clique em "**Download Zip**" e extraia para o local que desejar.

#### Agora é só abrir o arquivo e testar!

---

## 💬 Execução dos Testes

A execução é feita de forma **totalmente interativa** através do script principal:

```
Automação dos Ambientes.bat
```

Esse arquivo funciona como um **painel em linha de comando**, exibindo um menu que permite ao usuário escolher **como e o que executar**.

---

## 🎛️ Painel Interativo de Execução

Ao abrir o arquivo `Automação dos Ambientes.bat`, o sistema exibirá um menu como este:

```
==========================================================
      MONITORAÇÃO DE AMBIENTES AUTOMATIZADOS
==========================================================

Como você gostaria de executar os testes?

  [1] Executar todos visualmente (UI)
  [2] Executar todos em segundo plano (Headless)
  [3] Executar todos simultaneamente (Headless / Pabot)
  [4] Executar teste específico visualmente (UI)
  [5] Executar teste específico em segundo plano (Headless)
  [0] Sair
```

### 🔹 Opções disponíveis:

* **[1] Executar todos visualmente (UI)**
  → Abre o navegador e executa todos os testes com interface.

* **[2] Executar todos em segundo plano (Headless)**
  → Executa todos os testes sem abrir o navegador.

* **[3] Executar todos simultaneamente (Pabot)**
  → Roda todos os testes em paralelo, economizando tempo.

* **[4] Executar teste específico (UI)**
  → Exibe um novo submenu para escolher o sistema desejado (Portais, Autorizadores, etc).

* **[5] Executar teste específico (Headless)**
  → Mesmo submenu, porém rodando os testes sem abrir navegador.

---

### 🧭 Submenu de Testes Específicos

Ao escolher as opções **[4]** ou **[5]**, o painel mostrará algo assim:

```
Qual teste deseja executar?

  [1] Portais e Sistemas Gestores
  [2] Autorizadores Funcionalcard
  [3] Acesso ao Funcionalplant
  [4] Cadastro de Programas
  [5] Webview
  [0] Voltar
```

Cada número executa automaticamente o `.bat` correspondente dentro da pasta apropriada, por exemplo:

```
📂 02 Portais e Sistemas Gestores/
 ┣ 📜 2 Portais e Sistemas Gestores UI.bat
 ┗ 📜 2 Portais e Sistemas Gestores Headless.bat
```

---

## 📜 Outros Arquivos Importantes

Além do painel principal (`Automação dos Ambientes.bat`), o projeto contém outros scripts e pastas úteis:

* `ui-test.bat` → Executa **todos os testes com interface gráfica**.
* `headless-test.bat` → Executa **todos os testes em segundo plano**.
* `testes simultaneos headless.bat` → Executa **todos os testes em paralelo** via Pabot.
* `Testes - Atalhos/` → Permite executar os testes individualmente em UI ou Headless.

Durante a execução, o terminal exibirá mensagens como:

```
✅ Sucesso: Login realizado com sucesso.
❌ Erro: Falha ao acessar página.
❗ Alerta: Campo "Usuário" não encontrado.
```

---

## 📂 Estrutura do Projeto
Arquivos com * aparecem somente após as execuções ou não estão inclusos no repositório.
```
📦 ROBOT/
 ┣ 📂 02 Portais e Sistemas Gestores/     # Testes de sistemas e portais internos
 ┣ 📂 03 Autorizadores/                   # Testes de autorizadores (UI e Headless)
 ┣ 📂 08 Acesso ao Funcionalplant/        # Testes de acesso ao ambiente Funcionalplant
 ┣ 📂 10 Cadastro de Programas/           # Testes de cadastro e integração de programas
 ┣ 📂 11 Webview/                         # Testes de webview e integrações
 ┣ 📂 *env/                               # Variáveis de ambiente (não versionadas)
 ┣ 📂 *results/                           # Saída de logs e resultados
 ┣ 📂 Testes - Atalhos/                   # Atalhos para execuções rápidas
 ┣ 📜 Automação dos Ambientes.bat         # Painel interativo principal
 ┣ 📜 geral-resource.robot                # Variáveis e keywords compartilhadas
 ┣ 📜 ui-test.bat                         # Executa todos os testes com interface
 ┣ 📜 headless-test.bat                   # Executa todos os testes em segundo plano
 ┣ 📜 testes simultaneos headless.bat     # Execução paralela com Pabot
 ┣ 📜 *saida_console_pabot.txt            # Registro de execução paralela
 ┣ 📜 README.md                           # Documentação do projeto
 ┣ 📜 .gitignore                          # Arquivos e pastas ignorados pelo Git
```

---

## 🧩 Tecnologias Utilizadas

* **Robot Framework**
* **SeleniumLibrary**
* **Python**
* **Pabot** (execução paralela)
* **Batch Scripts (.bat)**
* **Windows Terminal**

---

## 🛡️ Segurança e Privacidade

* Nenhum log sensível é versionado.
* Credenciais permanecem **apenas em ambiente local** (`env/*.robot`).
* A execução pode ser feita **sem editar código**, apenas interagindo com scripts e menus.

---

## 👨‍💻 Autor

**Kaique Nascimento de Oliveira**
Aprendiz de tecnologia com foco em **automação de testes e monitoramento de sistemas**.
Atuando, na área de **Monitoria e Operações** da **Funcional Health Tech**.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kaiquenascimentooliveira/)